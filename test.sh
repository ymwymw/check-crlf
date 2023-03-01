#!/bin/bash
# this is a sorry excuse for a test, but hey, it kinda works

mkdir -p "temp"

printf "line1\r\nline2\nline3" > "temp/bad"
printf "line1\r\nline2\nline3" > "temp/ignored"
printf "\n" > "temp/good-lf"
printf "\r\n" > "temp/good-crlf"
printf $'\t' > "temp/tab"

printf $(echo grep $'\t' temp/good-crlf)
printf $(echo grep $'\t' temp/tab)
printf $(echo grep -P "\t" temp/good-crlf)
printf $(echo grep -P "\t" temp/tab)

./entrypoint.sh . "temp/ignored"

RESULT="$?"

rm -r "temp"

# is there a better way to do this?
[ $RESULT -eq 1 ]
exit $?
