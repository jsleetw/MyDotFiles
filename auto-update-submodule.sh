#!/usr/bin/env bash

git submodule foreach git checkout master
git submodule foreach git pull
git status
echo "# If any updates. Test it! before git add"
