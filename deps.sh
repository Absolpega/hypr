#!/bin/sh

this="$(dirname $(readlink -f $0))"

grep -v '^#\|^$' "$this/dependencies.txt" | paru --needed -S -
