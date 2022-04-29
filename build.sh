#!/usr/bin/env bash

rm -rf dist && mkdir dist

npx tailwindcss -i tailwind.css -o dist/styles.css --minify

hash=$(shasum dist/styles.css | awk '{print $1}')
new_file="styles.$hash.css"
mv dist/styles.css dist/$new_file

sed "s/styles\.css/$new_file/" index.html > dist/index.html
