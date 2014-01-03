#!/bin/sh

git checkout master
tinker --build
git add -A .
git commit -m "static content update"
git checkout gh-pages
rm -rf *

for file in `git ls-tree master blog/html -r --name-only`; do
  `git checkout master $file`
done

mv blog/html/* .
rm -rf blog
touch .nojekyll
git add -A .
git ci -m "content update"
git push origin gh-pages
git checkout master

echo "Roll back html content commit?"
read input
case "$input" in
 y|Y) git reset --hard HEAD~1;;
 *) echo "not rolling back";;
esac