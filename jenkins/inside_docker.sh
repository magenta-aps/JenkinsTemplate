#!/bin/bash

function title(){ CHAR='*';CONTENT="$CHAR $* $CHAR";BORDER=$(echo "$CONTENT" | sed "s/./$CHAR/g");echo "";echo "$BORDER";echo "$CONTENT";echo "$BORDER";}
function subtitle(){ CHAR=' ';CONTENT="$CHAR $* $CHAR";BORDER=$(echo "$CONTENT" | sed "s/./$CHAR/g");echo "";echo "$BORDER";echo "$CONTENT";echo "$BORDER";}

title "Inside docker"

# Switch to the source directory
cd src/

# Setup the build environment
title "Setting up build environment"

apt-get update
apt-get install -y git python2.7 python-pip python-dev
pip install --upgrade pip

# Setup the project
title "Seeting up project"

virtualenv --python=2.7 ~/venv/
source ~/venv/bin/activate
pip install -r requirements.txt
python manage.py migrate

# Test the project (and collect coverage)
title "Running tests"
echo "TEST_OUTPUT_DIR = '../reports/test/'" >> project/settings.py
echo "TEST_RUNNER = 'xmlrunner.extra.djangotestrunner.XMLTestRunner'" >> project/settings.py
./runtests.sh
coverage xml -o ../reports/coverage.xml

# Lint the code
title "Checking the code"
pylint -rn -f parseable app/ | tee ../reports/pylint.log
flake8 app/ | tee ../reports/pep8.log

# Generate documentation
title "Generating docs"
cd docs/ && make html
cd ..
cp -r docs/_build/html/ ../reports/docs/

# Generate exit status
true
