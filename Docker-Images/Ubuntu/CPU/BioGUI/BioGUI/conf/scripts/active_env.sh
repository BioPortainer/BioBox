#!/bin/bash

echo "Enabling PyEnv..."
eval "$(pyenv init -)"
echo "Enabling Virtualenv"
eval "$(pyenv virtualenv-init -)"
echo "Enabling $1"
pyenv activate $1
echo "4"
echo "Enabling $2"
conda activate $2

