#!/usr/bin/env bash
echo "Infinite Loop for Pulling/Pushing Overleaf Repository [CTRL+C to Stop]"

INTERVAL=5
ITERATION=1

for(( ; ; ))
do
    echo "GitHub update iteration $ITERATION started (Elapsed time: $(($SECONDS))s)"
    git fetch

    if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]; then
	echo "Changes on origin/master, pushing to github/master"
        git pull origin master
    	git push github master
    else
        echo "No Changes on origin/master"
    fi

    echo "GitHub update iteration $ITERATION ended (Elapsed time: $(($SECONDS))s)"
    ITERATION=$(($ITERATION+1))
    sleep $INTERVAL
done