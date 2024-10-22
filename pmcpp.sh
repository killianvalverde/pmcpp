#!/bin/bash

project_name="mytest"
author="Killian Valverde"
description="Project for testing."
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
git commit -m "license: add gplv3 copying file"
sleep 1
git add .gitignore
git commit -m "config: add .gitignore to exclude unwanted files"
sleep 1
git add README.md docs/
git commit -m "docs: add readme files with project overview"
sleep 1
git add Doxyfile
git commit -m "docs: add doxyfile for generating documentation"
sleep 1
git add "src/$project_name/exception.hpp" "src/$project_name/program.cpp" "src/$project_name/program.hpp" "src/$project_name/program_args.hpp" "src/main/main.cpp"
git commit -m "src: add initial source files"
sleep 1
git add "tests/${project_name}_gtest/main.cpp" "tests/${project_name}_gtest/program_test.cpp"
git commit -m "test: add initial test files"
sleep 1
git add CMakeLists.txt src/CMakeLists.txt "src/$project_name/CMakeLists.txt" "src/main/CMakeLists.txt" tests/CMakeLists.txt "tests/${project_name}_gtest/CMakeLists.txt"
git commit -m "build: add cmake configuration files"
