#!/usr/bin/env bash

set -eu

DIR="${1:-}"

if [[ -z "$DIR" ]]; then
  echo "Syntax: $0 [dir]" >&2
  exit 1
fi

if [[ ! -d "$DIR" ]]; then
  echo "Not a directory: $DIR" >&2
  exit 1
fi

for FILE in $( find $DIR -name "*ingress*.yaml" ) ; do

  if grep extensions/v1beta1 $FILE ; then

    echo "Applying ingress fix to $FILE .."

    cat $FILE |
        sed 's|^apiVersion: extensions/v1beta1$|apiVersion: networking.k8s.io/v1|' |
        sed -E 's|^(\s+)serviceName: (.*)$|\1service:\n\1  name: \2|' |
        sed -E 's|^(\s+)servicePort: (.*)$|\1  port:\n\1    number: \2|' |
        sed -E 'sX^((\s+)(- |  )path: (.*))$X\1\n\2  pathType: ImplementationSpecificX' > $FILE.tmp

    mv -f $FILE.tmp $FILE
  fi


done

