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
