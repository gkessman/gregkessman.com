#!/bin/bash

aws s3 sync \
./public \
s3://gregkessman.com \
--exclude "index.html" \
--sse

aws s3 sync \
./public \
s3://gregkessman.com \
--exclude "*" \
--include "index.html" \
--delete \
--sse

# Break the CDN cache
aws configure set preview.cloudfront true

CF_ID=$(aws cloudfront list-distributions \
--query "DistributionList.Items[].Id[]" \
--output text)

aws cloudfront create-invalidation \
--distribution-id ${CF_ID} \
--paths /index.html