#!/bin/bash

# Install petsc
cd /petsc/
./configure PETSC_ARCH=mpich-complex --with-scalar-type=complex --download-{mumps,scalapack,superlu,superlu_dist,parmetis,metis,fblaslapack}
make

#Install petsc4py
cd /petsc4py/
python setup.py build
python setup.py install

#install pysit.
cd /pysit/
python setup.py build
python setup.py install