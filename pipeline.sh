#!/bin/bash

# We take at least two parameters
# -repo <url>
# -date <dd-mm-YYYY>

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -r|--repo)
    REPO="$2"
    shift # past argument
    ;;
    -d|--date)
    DATE="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

# Check if a repository was given
if [ ! -n "$REPO" ]
then
	>&2 echo "No repo was specified"
	exit 1
fi

# If no data is given use today
if [ ! -n "$DATE" ]
then
	DATE=`date -I`
fi

# Were to save this run into
SAVE_INTO=$RANDOM

# Call pipeline sequence
docker run --rm -v /tmp/probeurre-data:/probeurre-data probeurre:cloner python3 probeurre.py -w "$SAVE_INTO" -r "$REPO"

docker run --rm -v /tmp/probeurre-data:/probeurre-data probeurre:extracter ./extracter.sh -w "$SAVE_INTO" -d "$DATE"

docker run --rm -v /tmp/probeurre-data:/probeurre-data probeurre:analyzer ./analyzer.sh -w "$SAVE_INTO" 

docker run --rm -v /tmp/probeurre-data:/probeurre-data -P 5555:5555 probeurre:visualizer python3 probeurre.py -w "$SAVE_INTO" 

rm -rf /tmp/probeurre-data/$SAVE_INTO

