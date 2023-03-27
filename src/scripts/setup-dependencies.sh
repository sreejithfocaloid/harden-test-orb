#!/usr/bin/env bash
echo "Install Slim.ai CLI"
curl https://platform.zero.dev.saas.getslim.ai/.service/releases/slim/0.0.11-dev | sh

echo "Install XML Utilities"
sudo apt-get update -qq
sudo apt install -qq -y libxml2-utils

# echo "Configure Slim.ai CLI"
# echo "Adding ${HOME}/.slim/bin"
# export PATH="${HOME}/.slim/bin:$PATH"
# echo "${HOME}/.slim/bin" >>$GITHUB_PATH
slim config gen --save --token ${PORTAL0_API_TOKEN} --org ${PORTAL0_ORGANIZATION_ID}
# echo "token: ${PORTAL0_API_TOKEN}"> ~/.config/slim/config
# echo "default_org: ${PORTAL0_ORGANIZATION_ID}">> ~/.config/slim/config
# echo "endpoint: https://api.dev-jb.saas.getslim.ai">> ~/.config/slim/config
# #Optional For Testing
slim status build
cat ~/.config/slim/config