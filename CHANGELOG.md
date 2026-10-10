## v1.10

- Fix "printer cannot be found" on AirPrint clients: Avahi now advertises only on `end0` and the mDNS reflector is disabled. Previously Avahi ran on end0, wlan0, docker0, hassio and every veth interface with the reflector on, saw its own announcements and renamed the host endlessly (`...-2.local` to `...-77.local`), so clients held a stale hostname

## v1.9

- Route CUPS's error log to stdout (`ErrorLog /dev/stdout`, `LogLevel info`) so scheduler/backend/job errors show up in the Supervisor add-on log instead of being invisible inside the container
- Applied automatically to existing `/config/cups` installs too, not just fresh ones

## v1.8

- Updated Splix to 2.0.1 with build at install 
- Added in Samsung m2020 PPD for my instance

## v1.7

- Fix the issue with "ulimit" size and permissions
  
## v1.5

- Update Debian Base to 7.6.2
- Add HP drivers (printer-driver-hpcups)
