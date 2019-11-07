export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

export VENV=$HOME/.virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$SOURCE

[ ! -d "$VENV/default" ] && virtualenv $VENV/default

source /usr/local/bin/virtualenvwrapper.sh
source $VENV/default/bin/activate
