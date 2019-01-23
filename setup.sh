#!/bin/bash

# Install petsc

cd /petsc/
git checkout 57f8f5fd4131aa625156f794bdbd51339abe2d6c

./configure PETSC_ARCH=mpich-complex --with-scalar-type=complex --download-{mumps,scalapack,superlu,superlu_dist,parmetis,metis,fblaslapack}
make

#Install petsc4py
cd /petsc4py/
git checkout 16675da20ac64ed690db3633850f2573f54d0d8a

python setup.py build
python setup.py install

#install pysit.
cd /pysit/
python setup.py build
python setup.py install
