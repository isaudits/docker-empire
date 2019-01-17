# docker-empire
Docker implementation of Empire framework based upon Debian stable image

## Description
We decided to roll our own because:
- Custom entrypoint that allows us to start REST API
- Resource scripts to auto launch listeners (pass woth -r)
- Use debian instead of Ubuntu (smaller and we already use this image elsewhere)

If you are viewing this on docker hub, clone the full repo at https://github.com/isaudits/docker-empire
to get the launcher scripts and alias files described below.

## Build Notes
Pull:

    docker pull isaudits/empire

or Build:

    ./build.sh

# Usage
Provided launcher script will automatically launch Empire with parameters based
on environment variables except local IP (autodetected) and auto launch an https and
meterpreter listener. If any additional arguments are passed to the script, those will
be passed as parameters as opposed to automatically launching listeners.

Default environment variables can be overridden via command line launch or .env file.

--------------------------------------------------------------------------------

Copyright 2018

Matthew C. Jones, CPA, CISA, OSCP, CCFE

IS Audits & Consulting, LLC - <http://www.isaudits.com/>

TJS Deemer Dana LLP - <http://www.tjsdd.com/>

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