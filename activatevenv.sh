#!/bin/bash

#break on first error
set -e

if [ ! -d venv ] ; then
  echo "No pytorch venv dir. Creating venv. Please wait..."
  python3 -m venv ./venv
  source ./venv/bin/activate
  if [[ -z $VIRTUAL_ENV ]] ; then
    echo "ERROR. Not in an virtual environment"
    exit 1
  fi
  echo "Virtual env:$VIRTUAL_ENV"

  echo "Installing python packages"
  pip install numpy

else
  source ./venv/bin/activate
  if [[ -z $VIRTUAL_ENV ]] ; then
    echo "ERROR. Not in an virtual environment"
    exit 1
  fi
  echo "Virtual env:$VIRTUAL_ENV"
fi

