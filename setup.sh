#!/bin/sh
wget http://ftp.gnu.org/gnu/bison/bison-3.0.tar.gz
tar -xzvf bison-3.0.tar.gz
cd bison-3.0
./configure
make
sudo make install
sudo apt-get install flex

# Steps I used to get example files
#cd ..
#rm bison-3.0.tar.gz
#mkdir calc
#cd calc
#wget http://alumni.cs.ucr.edu/~lgao/teaching/calc/calc.lex
#wget http://alumni.cs.ucr.edu/~lgao/teaching/calc/calc.y
#wget http://alumni.cs.ucr.edu/~lgao/teaching/calc/Makefile
#wget http://alumni.cs.ucr.edu/~lgao/teaching/calc/main.cc
#wget http://alumni.cs.ucr.edu/~lgao/teaching/calc/heading.h
