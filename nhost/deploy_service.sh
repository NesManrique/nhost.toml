#!/bin/sh
CONFIGURATION_FILE=$1
SERVICE_ID=$2
export NHOST_DOMAIN="staging.nhost.run"
# VERSION="1.0.0"

# this only needs to be done once in each environment
# but usually CIs start with a clean environment each time
#
# you can also login with your regular email/password
# credentials if you prefer
# echo "login in"
# nhost login --pat $PAT

# this only needs to be done once in each environment
# but usually CIs start with a clean environment each time
# nhost docker-credentials configure --no-interactive

# docker buildx build \
#     --push \
#     --platform linux/amd64,linux/arm64 \
#     -t $IMAGE:$VERSION \
#     .
echo
echo "running config validate"
echo
nhost run config-validate \
    --config $CONFIGURATION_FILE \
    --service-id $SERVICE_ID

echo
echo "running config deploy"
echo
nhost run config-deploy \
    --config $CONFIGURATION_FILE \
    --service-id $SERVICE_ID