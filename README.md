# GitHub Action to check for files with mixed line endings (CRLF and LF)

GitHub Action to add to a workflow, to keep in check those developers that commit files with mixed line endings. This benefits those that have repos that already have 2 types of files in them, but don't want files with mixed line endings.

Uses grep on a docker container.

By default checks all files in the repository (excluding the .git folder), but can be given a list of separate directories to check.

## Example

```yml
name: Example usage

on: push

jobs:
  example-workflow:
    name: Example workflow using the Check Mixed Line Endings action
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository contents
        uses: actions/checkout@v2

      - name: Use action to check for mixed line endings (CRLF and LF)
        uses: ymwymw/check-mixed-line-endings@v2
        with: # omit this mapping to use default path
          path: ./a-custom-path
```

## Contributors

This was forked from `erclu/check-crlf` and modified to check for mixed line endings.

A big thank you to @erclu and @Rotendahl!!
The following is from @erclu:
Most of the work was done by @Rotendahl, I mainly copy-pasted stuff from stack overflow :)

<!--
  TODO rewrite using js (better performance)
-->
