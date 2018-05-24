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


# Now install Petsc 
RUN mkdir /pysit_dep/
WORKDIR /pysit_dep/
RUN git clone http://bitbucket.org/petsc/petsc

WORKDIR /pysit_dep/petsc/
RUN git fetch && git checkout maint-3.8 #newer version of pysit has some problems with petsc extension
RUN ./configure PETSC_ARCH=mpich-complex --with-scalar-type=complex --download-{mumps,scalapack,superlu,superlu_dist,parmetis,metis,fblaslapack}
RUN make

# Install petsc4py
ENV PETSC_DIR="/pysit_dep/petsc/"
ENV PETSC_ARCH="mpich-complex"
#ENV PETSC_ARCH="arch-darwin-c-debug"

WORKDIR /pysit_dep/
RUN git clone http://bitbucket.org/petsc/petsc4py
WORKDIR /pysit_dep/petsc4py
RUN  python setup.py build
RUN  python setup.py install

# Install Pysit
RUN apt-get install -y libgl1-mesa-glx #lib gl got messed up.
WORKDIR /
RUN git clone https://github.com/pysit/pysit
WORKDIR /pysit/

RUN pip install -r pip-requirements 
RUN python setup.py build
RUN python setup.py install

# changed file name
