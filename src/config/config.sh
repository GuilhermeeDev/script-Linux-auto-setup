#!/bin/bash
# shellcheck disable=SC1091

./config/createFiles.sh
./config/findValues.sh
./config/createAllJsonConfig.sh

./config/menu.sh