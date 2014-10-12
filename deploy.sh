#!/bin/bash
set -ev
git clone -q https://${GIT_NAME}:${GH_TOKEN}@github.com/Mjolken/Mjolken.git gh-pages
npm install less
git config --global user.name ${GIT_NAME}
git config --global user.email ${GIT_EMAIL}
git config --global push.default simple
git checkout master
sha=$(git rev-parse HEAD)
cd gh-pages
git checkout gh-pages
cd ..
./node_modules/less/bin/lessc assets/css/style.less > gh-pages/assets/css/style.css
cd gh-pages
touch .nojekyll
git add --all .
git commit -m 'Updating to Mjolken/Mjolken@'${sha}
git push origin gh-pages -q