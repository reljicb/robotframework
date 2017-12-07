#!/usr/bin/env bash

WEBDRIVERS_HOME=/Users/bojanreljic/development/workspace/webdrivers
SAFARIDRIVER_HOME=/usr/bin

java -Dwebdriver.opera.driver="${WEBDRIVERS_HOME}/operadriver" -jar bin/selenium-server-standalone-3.7.1.jar  -role node -nodeConfig ./nodeConfig.json $@
