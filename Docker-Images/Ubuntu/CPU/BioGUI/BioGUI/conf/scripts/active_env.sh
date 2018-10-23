#!/bin/bash

echo "1"
eval "$(pyenv init -)"
echo "2"
eval "$(pyenv virtualenv-init -)"
echo "3"
pyenv activate $1
echo "4"
conda activate $2
