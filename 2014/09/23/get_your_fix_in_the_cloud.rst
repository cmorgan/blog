Get your FIX in the cloud
=========================

The need arose recently to setup a client with an AWS EC2 based FIX connection
to the LSE via a Proquote VPN. The Proquote VPN connection must be initiated by
the client which rules out an AWS VPC connection (which is receive only). We
chose a software VPN, OpenSwan to initiate the connection to Proquote.

Amazon EC2 only allows TCP/UDP and ICMP therefore IPSec's ESP and AH headers
will be blocked, forcing us to use an encapsulated IPSec connection over UDP.
Ensure that the Proquote side is configured in IPSec tunneling mode.

The version of OpenSwan which we had success with was Linux Openswan
U2.6.41-4-gd5ce941/K3.2.0-64-virtual from source, check that this Git hash has
been released into your version of OpenSwan.

Given a valid OpenSwan install on a debian based Linux, the following script
will setup the OpenSwan connection initiated from EC2. 

.. code-block:: bash 

    # following https://gist.github.com/winhamwr/2871257
    #
    # EC2 security groups: open UDP access on 500 and 4500
    #
    # IPSec version used with success: Linux Openswan U2.6.41-4-gd5ce941/K3.2.0-64-virtual (netkey)

    ELASTIC_IP="<your ip>"
    SOURCE_IP="${ELASTIC_IP}"
    CONN_NAME="LSE_Proquote"
    SECURE_PSK="<your psk>"
    RIGHT_PUBLIC_IP="<proqute public ip>"
    RIGHT_SUBNET="<proquote internal ip>" 

    sudo apt-get install -y openswan
    #sudo ipsec verify  # Throws warnings as EC2 uses NETKEY Ipsec kernel stack

    sudo mv /etc/sysctl.conf /etc/sysctl.conf.bak

    cat > sysctl.conf << ENDMSG
    net.ipv4.ip_forward=1

    net.ipv4.conf.default.send_redirects = 0
    net.ipv4.conf.all.send_redirects = 0
    net.ipv4.conf.eth0.send_redirects = 0

    net.ipv4.conf.all.accept_redirects = 0
    net.ipv4.conf.default.accept_redirects = 0
    net.ipv4.conf.eth0.accept_redirects = 0
    ENDMSG

    sudo mv sysctl.conf /etc/sysctl.conf
    sudo sysctl -p /etc/sysctl.conf

    #sudo ipsec verify  # should now have no ERRORS

    # Main config file
    cat > ipsec.conf << ENDMSG
    version 2.0

    config setup
        nat_traversal=yes
        protostack=netkey
        virtual_private=%v4:10.0.0.0/8,%v4:172.16.0.0/12,%v4:192.168.0.0/16,%v4:!192.168.5.0/24
        oe=off

    include /etc/ipsec.d/*.conf
    ENDMSG

    sudo mv ipsec.conf /etc/.


    # Connection specific config.
    cat > $CONN_NAME.conf << ENDMSG
    conn $CONN_NAME
        type=tunnel
        authby=secret
        left=%defaultroute
        leftsourceip=$SOURCE_IP
        leftid=$ELASTIC_IP
        leftnexthop=%defaultroute
        right=$RIGHT_PUBLIC_IP
        rightid=$RIGHT_PUBLIC_IP
        rightsubnet=$RIGHT_SUBNET
        esp=aes192-sha1
        keyexchange=ike
        ike=aes192-sha1
        salifetime=43200s
        pfs=yes
        auto=start
        dpdaction=restart
        forceencaps=yes
    ENDMSG

    sudo mv $CONN_NAME.conf /etc/ipsec.d/.

    # Ipsec.secrets
    cat > ipsec.secrets << ENDMSG
    $ELASTIC_IP $RIGHT_PUBLIC_IP: PSK "$SECURE_PSK"
    ENDMSG
    sudo mv ipsec.secrets /etc/.

.. author:: default
.. categories:: finance
.. tags:: finance
.. comments::
