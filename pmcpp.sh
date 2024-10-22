#!/bin/bash

project_name="mytest"
author="Killian Valverde"
description="Project for testing"
project_name_upper_case="${project_name^^}"
year=$(date +%Y)
date=$(date +%Y/%m/%d)
source_folder="./template-fetch-content"
# source_folder="./template-find-package"
destination_folder="./$project_name"

cp -r "$source_folder" "$destination_folder" || exit

mv "$destination_folder/src/{{PROJECT_NAME}}" "$destination_folder/src/$project_name"
mv "$destination_folder/src/$project_name/{{PROJECT_NAME}}.hpp" "$destination_folder/src/$project_name/$project_name.hpp"
mv "$destination_folder/tests/{{PROJECT_NAME}}_test" "$destination_folder/tests/${project_name}_test" 

find "$destination_folder" -type f -exec sed -i "s|{{PROJECT_NAME}}|$project_name|g" {} +
find "$destination_folder" -type f -exec sed -i "s|{{DESCRIPTION}}|$description|g" {} +
find "$destination_folder" -type f -exec sed -i "s|{{PROJECT_NAME_UPPER_CASE}}|$project_name_upper_case|g" {} +
find "$destination_folder" -type f -exec sed -i "s|{{AUTHOR}}|$author|g" {} +
find "$destination_folder" -type f -exec sed -i "s|{{YEAR}}|$year|g" {} +
find "$destination_folder" -type f -exec sed -i "s|{{DATE}}|$date|g" {} +

cd "$destination_folder"
git init
# git commit --allow-empty -m "chore: initial commit"
git commit --allow-empty -m "Initial commit"
sleep 1
git checkout -b develop
# git flow init -d
# sleep 1
git add COPYING
git commit -m "chore: add GPLv3 license file"
sleep 1
git add .gitignore
git commit -m "chore: add .gitignore to exclude unwanted files"
sleep 1
# git add README.md docs/
git add README.md
git commit -m "docs: add README file with project overview"
sleep 1
git add Doxyfile
git commit -m "docs: add Doxyfile for documentation generation"
sleep 1
git add "src/$project_name/$project_name.hpp" "src/$project_name/exception.hpp" "src/$project_name/program.cpp" "src/$project_name/program.hpp" "src/$project_name/program_args.hpp" "src/main/main.cpp"
git commit -m "feat: add initial source code"
sleep 1
git add "tests/${project_name}_test/main.cpp" "tests/${project_name}_test/program_test.cpp"
git commit -m "test: add basic test structure"
sleep 1
git add CMakeLists.txt src/CMakeLists.txt "src/$project_name/CMakeLists.txt" "src/main/CMakeLists.txt" tests/CMakeLists.txt "tests/${project_name}_test/CMakeLists.txt"
git commit -m "build: add cmake configuration files"
