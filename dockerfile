# based on build with anaconda with python 2.7

FROM continuumio/anaconda

RUN apt-get update
RUN apt-get install -y vim # for editing files etc.
RUN apt-get install -y gcc
RUN apt-get install -y mpich

RUN conda update -n base conda

# should see if I can do this without having to conda...
#RUN conda install -y -c conda-forge libgfortran
RUN conda install -y -c anaconda libgfortran 

RUN conda install -y blas
RUN conda install -y cython
RUN conda install -y swig
RUN conda install -y -c conda-forge lapack

Run conda install -y -c anaconda numba
RUN conda install -y cmake
RUN conda install -y pyamg
RUN conda install -y make
RUN conda install -y mpi4py

RUN apt-get install -y libgl1-mesa-glx #lib gl got messed up.

# pull all git repo and install dependencies, wait to actually install
RUN git clone https://github.com/gregoryely/pysit.git
WORKDIR /pysit/
RUN pip install -r pip-requirements 

# pull petsc
WORKDIR /
RUN git clone http://bitbucket.org/petsc/petsc

# pull petsc4py
ENV PETSC_DIR="/petsc/"
ENV PETSC_ARCH="mpich-complex"
RUN git clone http://bitbucket.org/petsc/petsc4py

# copy the setup shell script.
# this script needs to be run interactively or else petsc fails to pull the correct dependencies
COPY setup.sh /