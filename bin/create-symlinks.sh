#!/bin/bash


SRC="/workspace/oss/codemucker/parent"
#SRC="/workspace/oss/codemucker/parent/src/templates/js-lib"
FILES=".gitignore .prettierrc.js .prettierignore jest.config.js tsconfig.json LICENSE"
PROJECTS="js-lang js-error js-logging js-vue2-bem js-vue2-helpers js-vue2-lifecycle js-jest-scenario"

for p in $PROJECTS; do
    proj_dir="/workspace/oss/codemucker/$p"
    if [ -d "$proj_dir" ]; then
        echo "linking project $proj_dir"
        for f in $FILES; do
            if [ ! -f $proj_dir/$f ]; then
                echo "linking $f to $SRC/$f"
                ln -s $SRC/$f $proj_dir/$f
            fi
        done
    fi
done