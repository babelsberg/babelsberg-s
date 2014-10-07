#!/bin/bash

curl -L -o master.zip https://github.com/bertfreudenberg/SqueakJS/archive/master.zip
unzip master.zip
rm -rf lib
rm -rf plugins
mv SqueakJS-master/*.js .
mv SqueakJS-master/lib .
mv SqueakJS-master/plugins .
rm -rf SqueakJS-master
rm master.zip
