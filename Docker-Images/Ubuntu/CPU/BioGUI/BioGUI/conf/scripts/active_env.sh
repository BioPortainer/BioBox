#!/bin/bash

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv activate $1
conda activate $2
