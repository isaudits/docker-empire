# docker-empire
Enhanced Docker implementation of Empire framework based upon offical image

## Description
Additional features stacked on top of official image:
- Official docker image does not have environment variable support
- Move default database and certificate location so it can easily be mounted
- Fix config file customization not being honored

## Available environment variables and default values
    EMPIRE_USER=admin
    EMPIRE_PASS=changeyourpassword
    EMPIRE_REST_PORT=1337
    EMPIRE_SOCKET_PORT=5000
    EMPIRE_LHOST=0.0.0.0
    EMPIRE_LPORT=443
    EMPIRE_DATA_PATH=/data
    EMPIRE_DB=sqlite
    EMPIRE_MYSQL_HOST=localhost:3306
    EMPIRE_MYSQL_USERNAME=empire_user
    EMPIRE_MYSQL_PASSWORD=empire_password
    EMPIRE_MYSQL_DB=empire

If you are viewing this on docker hub, clone the full repo at https://github.com/isaudits/docker-empire
to get the launcher scripts and alias files described below.

## Build Notes
Pull:

    docker pull isaudits/empire

or Build:

    ./build.sh

# Usage
Provided launcher script will automatically launch Empire server with parameters based
on environment variables except local IP (autodetected). If any additional arguments are 
passed to the script, those will be passed as parameters as opposed to automatically launching listeners.

Default environment variables can be overridden via command line launch or .env file.

# TODO
- Resource scripts no longer working as a server side parameter

--------------------------------------------------------------------------------

Copyright 2018

Matthew C. Jones, CPA, CISA, OSCP, CCFE

Symphona - <https://www.symphona.us/>

--------------------------------------------------------------------------------

Except as otherwise specified:

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.