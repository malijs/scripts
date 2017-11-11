#!/bin/sh

REPO='git://github.com/malijs/mali#branch'
RED='\033[0;31m'

run(){
  cd ../
  local path="./$1"
  echo "testing $path"
  cd $path && rm -rf node_modules/ && npm i --no-package-lock && npm i --no-package-lock $REPO && npm test

  if [[ $? != "0" ]]; then
    echo "${RED} $1 failed"
  fi
  cd ../
}

run "apikey"
run "condition-test"
run "iff"
run "logger"
run "metadata-auth"
run "onerror"
run "requestid"
run "tojson"
run "transform"
run "bearer"
run "error-metadata"
run "jwt"
run "metadata"
run "metadata-field-auth"
run "param"
run "toobject"
run "unless"