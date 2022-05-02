#!/bin/zsh

set -u

$(dirname $0)/brew_install.sh
$(dirname $0)/setup_configurations.sh
$(dirname $0)/setup_mac_settings.sh
$(dirname $0)/setup_version_managers.sh
