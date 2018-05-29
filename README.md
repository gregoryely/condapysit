# condapysit
Docker file(s) for pysit installed on top of an anaconda 2.7 image.  This image contains a ready to go container that will allow you run pysit ( http://pysit.org/ ) with minimal setup.  To install the image see ( https://hub.docker.com/r/gregoryely/condapysit/ ) where the image is stored.


## Instructions for building image
If you want to build the pysit image from scratch instead of pulling an image from  ( https://hub.docker.com/r/gregoryely/condapysit/ ) follow these steps once you have docker installed.  Petsc is unable to pull the dependencies from a dockerfile build and instead needs to installed from within the image.

1. Clone this repository ```https://github.com/gregoryely/condapysit.git```
2. In the directory build the image from the dockerfile ```docker build -t mycondapysit .```
3. Run the image interactively ```docker run --name myinstant -it mycondapysit``` you are now inside the container instance called myinstant
4. Install petsc, petsc4py and pysit ```source setup.sh```
5. Commit the current instance as a new image called mynewdockerimage.  From another terminal ```docker commit myinstant mynewdockerimage```
6. Done!  you can now push the new image to your own dockerhub repostitory.
