#!/bin/bash

export DISPLAY=:99
/etc/init.d/xvfb start

case "$1" in
  2.31)
    export VERSION=2.31.0
    ;;
  2.35)
    export VERSION=2.35.0
    ;;
  help)
    "$0" help
    echo "only support 2.31 and 2.35. default to 2.31"
    echo ""
    ;;
  *)
    export VERSION=2.31.0
esac

case "$2" in
  24)
    export FF_VERSION=24
    ;;
  25)
    export FF_VERSION=25
    ;;
  help)
    "$0" help
    echo "only support 24 and 25. default to 24"
    echo ""
    ;;
  *)
    export FF_VERSION=24
esac

java -jar /srv/selenium-server-standalone-$VERSION.jar -Dwebdriver.firefox.binary_path=/srv/firefox-$FF_VERSION/firefox/firefox
