# docker-empire
Docker implementation of Empire framework based upon Kali rolling image

## Description
We decided to roll our own because:
- Official docker image does not have ARM support
- Use kali rolling since we already use this image elsewhere
- Add in ttyd option for launching a web service with an Empire client terminal

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

# Empire web client

To launch a web service containing the empire web client:

    docker run -it --rm \
        -p 7681:7681 \
        -e EMPIRE_LHOST=<HOST IP ADDRESS> \
        -e EMPIRE_REST_PORT=1337 \
        -e EMPIRE_SOCKET_PORT=5000 \
        -e EMPIRE_USERNAME=<USERNAME> \
        -e EMPIRE_PASSWORD=<PASSWORD> \
        isaudits/empire tini -- ttyd -p 7681 powershell-empire client

# TODO
- .NET SDK and powershell packages not currently available in kali docker image for some reason; csharpserver does not work
- Resource scripts no longer working as a server side parameter
- Add script to launch empire cli web service

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