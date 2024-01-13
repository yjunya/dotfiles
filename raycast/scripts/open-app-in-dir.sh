#!/bin/bash

cd $2

eval "$(mise hook-env -s bash)"

open $1

