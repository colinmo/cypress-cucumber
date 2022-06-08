#!/bin/bash

mkdir -p /cypress/integrations/common/
cp /common.js /cypress/integrations/common/common.js
cp /cypress-basic.json /cypress.json
cp /support/* /cypress/support/
mkdir -p /var/run/dbus
dbus-daemon --config-file=/usr/share/dbus-1/system.conf
Xvfb -screen 0 1920x1080x24 :99 &
export DISPLAY=:99
cypress run --env USERNAME="${USERNAME}",PASSWORD="${PASSWORD}" 
