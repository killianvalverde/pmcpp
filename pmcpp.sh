#!/bin/bash

project_name="pmcpp"
author="Killian Valverde"
description="C++ project template."
project_name_upper_case="${project_name^^}"
year=$(date +%Y)
date=$(date +%Y/%m/%d)
source_folder="./TEMPLATE"
destination_folder="./$project_name"

cp -r "$source_folder" "$destination_folder" || exit

mv "$destination_folder/src/{{PROJECT_NAME}}" "$destination_folder/src/$project_name" 
mv "$destination_folder/tests/{{PROJECT_NAME}}_gtest" "$destination_folder/tests/${project_name}_gtest" 

find "$destination_folder" -type f -exec sed -i "s|{{PROJECT_NAME}}|$project_name|g" {} +
find "$destination_folder" -type f -exec sed -i "s|{{DESCRIPTION}}|$description|g" {} +
find "$destination_folder" -type f -exec sed -i "s|{{PROJECT_NAME_UPPER_CASE}}|$project_name_upper_case|g" {} +
find "$destination_folder" -type f -exec sed -i "s|{{AUTHOR}}|$author|g" {} +
find "$destination_folder" -type f -exec sed -i "s|{{YEAR}}|$year|g" {} +
find "$destination_folder" -type f -exec sed -i "s|{{DATE}}|$date|g" {} +

cd "$destination_folder"
git init
git flow init -d
sleep 1
git add COPYING
git commit -m "licence: add gplv3 copying"
sleep 1
git add .gitignore
git commit -m "conf: add .gitignore"
sleep 1
git add Doxyfile
git commit -m "doc: add doxyfile"
sleep 1
git add README.md docs/
git commit -m "doc: add readme files"
sleep 1
git add CMakeLists.txt src/ tests/
git commit -m "src: add sources base"
