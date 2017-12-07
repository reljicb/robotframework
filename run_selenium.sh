#!/usr/bin/env bash

WEBDRIVERS_HOME=/Users/bojanreljic/development/workspace/webdrivers
SAFARIDRIVER_HOME=/usr/bin

java -Dwebdriver.chrome.driver="${WEBDRIVERS_HOME}/chromedriver" -Dwebdriver.opera.driver="${WEBDRIVERS_HOME}/operadriver" -Dwebdriver.gecko.driver="${WEBDRIVERS_HOME}/geckodriver" -Dwebdriver.safari.driver="${SAFARIDRIVER_HOME}/safaridriver" -jar bin/selenium-server-standalone-3.7.1.jar  -enablePassThrough false $@
