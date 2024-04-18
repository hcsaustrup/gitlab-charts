#!/usr/bin/env bash

set -eu


helm search repo -l gitlab | awk '$1=="gitlab/gitlab"{print}'

