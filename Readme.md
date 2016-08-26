# Overview

This project is intended to create a deployable docker image with openresety, lib-gozerian, gozerian, keymaster, and apid.  To build peform the following.


#Building and Running

`make`

Then get a coffee, a beer, or both!  Subsequent builds will be faster.  I have deliberabely contructed the Dockerfile to create intermediate images to increase the build time after the first run.


TODO image should "just start"

#Debugging

To run the image execute the following command.

`docker run -t -i thirtyx/gatekeeper:0.0.1 /bin/sh`

Once in the image, you can start the individual processes with the following commands.

apid - to start apid
keymaster - to start keymaster