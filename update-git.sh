#!/usr/bin/env bash
echo "Infinite Loop for Pulling/Pushing Overleaf Repository [CTRL+C to Stop]"

INTERVAL=5
ITERATION=1
VERBOSE=false

while getopts ':v' flag; do
  case "${flag}" in
    v) verbose=true ;;
    *) echo "Unexpected option ${flag}" ;;
  esac
done

for(( ; ; ))
do
    if [ "$verbose" == true ]; then echo "GitHub update iteration $ITERATION started (Elapsed time: $(($SECONDS))s)"; fi
    yes n | git fetch

    if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]; then
	echo "Changes on origin/master, pushing to github/master (Iteration: $ITERATION, Elapsed: $(($SECONDS))s)"
        yes n | git pull origin master
    	yes n | git push github master
    else
        if [ "$verbose" == true ]; then echo "No Changes on origin/master"; fi
    fi

    if [ "$verbose" == true ]; then echo "GitHub update iteration $ITERATION ended (Elapsed time: $(($SECONDS))s)"; fi
    ITERATION=$(($ITERATION+1))
    sleep $INTERVAL
done