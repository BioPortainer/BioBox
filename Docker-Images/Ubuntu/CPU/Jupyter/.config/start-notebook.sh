#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

jupyter-$JUPYTER_TYPE --ip=0.0.0.0 --port=$JUPYTER_PORT --no-browser --notebook-dir=$HOME/workdir/notebooks --allow-root

echo " " >> /.config/.login
echo " " >> /.config/.login
echo "############## Jupyter Notebook ##############" >> /.config/.login
echo " " >> /.config/.login
jupyter noteebook list >> /.config/.login
echo " "
cat /.config/.login
