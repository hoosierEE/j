#!/usr/bin/env bash

# Swap filename extension from one form to another.
# Example use case: rename all *.markdown to *.md in the current directory.
# Example usage:
# $ swapExtension.sh markdown md

# Credit for the core idea comes from here:
# http://nixtricks.wordpress.com/2009/08/28/bash-batch-edit-extensions-in-the-cli/

for i in *.$1; do mv "$i" "${i%%$1}$2"; done
