#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

aws ssm list-documents \
  --filters Key=Owner,Values=Amazon \
  --query 'DocumentIdentifiers | sort_by(@, &CreatedDate) | reverse(@)' \
  --region us-east-1
  | tee list-documents.json
    
