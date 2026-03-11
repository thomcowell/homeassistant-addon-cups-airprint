#!/usr/bin/with-contenv bashio

ulimit -n 524288

until [ -e /var/run/avahi-daemon/socket ]; do
  sleep 1s
done

bashio::log.info "Preparing directories"

# Save bundled PPD files before /etc/cups is replaced
mkdir -p /tmp/cups-ppd-update
cp /etc/cups/ppd/*.ppd /tmp/cups-ppd-update/ 2>/dev/null || true

if [ ! -d /config/cups ]; then cp -v -R /etc/cups /config; fi
rm -v -fR /etc/cups

ln -v -s /config/cups /etc/cups

# Always update bundled PPDs so container image updates take effect
mkdir -p /etc/cups/ppd
cp /tmp/cups-ppd-update/*.ppd /etc/cups/ppd/ 2>/dev/null || true
rm -rf /tmp/cups-ppd-update

bashio::log.info "Starting CUPS server as CMD from S6"

cupsd -f
