#!/bin/bash
git submodule foreach --recursive '
    branch="develop";
    git checkout $branch;
    git pull origin $branch;
'