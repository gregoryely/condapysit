# condapysit
Docker file for pysit installed on top of an anaconda 2.7 image.  This image contains a ready to go container that will allow you run pysit ( http://pysit.org/ ) with minimal setup.

## Setting up graphics
If you want to be able to see plots from within the container you will need to setup x11 forwarding on a mac.  see for detailed instructions ( https://sourabhbajaj.com/blog/2017/02/07/gui-applications-docker-mac/ ) or use the abbrivatied instructions below.

1. Install Xquartz from https://www.xquartz.org/ if you don't have it installed already.
2. Open Xquartz and in the "security" tab make sure  “Allow connections from network clients”  is enabled.
3. In a terminal run: xhost + 127.0.0.1
  This will allow the container to forward your display to 

## To install:

first download Docker and setup an account from https://www.docker.com/

#open a terminal to pull the image from docker hub to your machine:
#this could take a few minutes as the image is roughly two gigs.
docker pull gregoryely/condapysit

## To run it 

docker run -it -e DISPLAY=docker.for.mac.localhost:0 gregoryely/condapysit
