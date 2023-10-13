#!/bin/bash

cd $2

eval "$(rtx hook-env -s bash)"

open $1

