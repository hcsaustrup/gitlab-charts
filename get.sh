#!/usr/bin/env bash

set -eu

helm repo add gitlab https://charts.gitlab.io/ || true
helm repo update gitlab

CHART="${1:-}"
VERSION="${2:-}"

if [[ -z "$VERSION" || -z "$CHART" ]]; then
  echo "Syntax: $0 [chart] [version]" >&2
  exit 1
fi

helm pull gitlab/$CHART --version $VERSION

FILE=$CHART-$VERSION.tgz
if [[ ! -f $FILE ]]; then
  echo "File not found: $FILE" >&2
  exit 1
fi

mkdir --parent $CHART-$VERSION
tar xvf $FILE -C $CHART-$VERSION --strip-components=1

rm -rf $FILE

