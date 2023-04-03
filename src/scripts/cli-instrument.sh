#!/bin/bash
export PATH="${HOME}/.slim/bin:$PATH"
echo Hello "Instrument"
echo "${ env.ABC }"
SOURCE_CONNECTOR_ID="dockerhub.public"
PROJECT_IMAGE_INSTRUMENTED="sreejithfocaloid/node-example:latest.instrumented"
PROJECT_IMAGE_SLIMMED="sreejithfocaloid/node-example:latest.slimxx"
BASEIMAGE="sreejithfocaloid/node-example:latest"
IMAGE_PLATFORM="linux/amd64"
TARGET_CONNECTOR_ID="${CONNECTOR_ID}"

log_output=$(slim instrument \
  --platform="$IMAGE_PLATFORM" \
  --target-image-connector "$SOURCE_CONNECTOR_ID" \
  --instrumented-image-connector "$TARGET_CONNECTOR_ID" \
  --instrumented-image "$PROJECT_IMAGE_INSTRUMENTED" \
  --hardened-image-connector "$TARGET_CONNECTOR_ID" \
  --hardened-image "$PROJECT_IMAGE_SLIMMED" \
  "$BASEIMAGE" 2>&1 | tee /dev/stderr)

workflow_id=$(echo "$log_output" | grep -Eo 'workflow id: [a-zA-Z0-9\.]+')
workflow_id=${workflow_id#"workflow id: "}

if [[ $log_output =~ \[instrument\]\ instrumented ]]; then
  echo "The image has been successfully instrumented ($workflow_id)."
else
  echo "The image instrumentation failed ($workflow_id)."
  exit 1
fi