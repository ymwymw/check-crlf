#!/bin/bash

printf "searching for mixed line endings (CRLF and LF) in: $1\n"
# TODO allow multiple paths with $@ instead of $1

BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
NC='\033[0m'

FILES_TYPES="$(\
    find . ! -path "./.git/*" -not -type d  -exec file "{}" ";"
)"

FILES_WITH_MIXED=$(echo "$FILES_TYPES" | grep " CRLF, LF " | cut -d ":" -f 1)

for word in $2
do
    FILES_WITH_MIXED=$(echo "$FILES_WITH_MIXED" | grep "^./$word" --invert-match)
done

if [ -z "$FILES_WITH_MIXED" ]
then
    printf "${BOLD_GREEN}No files with mixed line endings (CRLF and LF) found.${NC}"
    exit 0
else
    NR_FILES=$(echo "$FILES_WITH_MIXED" | wc -l)
    printf "${BOLD_RED}Found $NR_FILES files with ixed line endings (CRLF and LF).${NC}"
    printf "$FILES_WITH_MIXED"
    exit $NR_FILES
fi
