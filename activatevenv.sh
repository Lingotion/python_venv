#!/bin/bash

#break on first error
set -e

# Function to check if a command exists
command_exists () {
    type "$1" &> /dev/null ;
}

# Try to find Python 3, then Python 2, then fallback to Python
if command_exists python3 ; then
    PYTHON_CMD=python3
elif command_exists python2 ; then
    PYTHON_CMD=python2
elif command_exists python ; then
    PYTHON_CMD=python
else
    echo "Python is not installed on this system."
    exit 1
fi


if [ ! -d venv ] ; then
  echo "No pytorch venv dir. Creating venv. Please wait..."
  $PYTHON_CMD -m venv ./venv
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

