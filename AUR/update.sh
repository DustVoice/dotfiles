#!/bin/sh
for dir in *; do
    if [ -d "${dir}" ]; then
        cd ${dir}
        git fetch --all
        BEHIND=$(git rev-list HEAD...origin/master --count)
        if [[ ! ${dir} -eq 0 ]]; then
            echo "$(pwd) is ${BEHIND} commits behind"
        fi
        cd ..
    fi
done
