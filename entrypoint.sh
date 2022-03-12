#!/bin/bash
set -e

# setup dds router environment
source "/DDS-Router/install/setup.bash"
exec "$@"