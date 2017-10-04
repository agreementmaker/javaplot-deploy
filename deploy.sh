#!/usr/bin/env bash

if [ ! -e JavaPlot-0.4.0.tar.bz2 ]; then
  wget https://downloads.sourceforge.net/project/gnujavaplot/javaplot/0.4.0/JavaPlot-0.4.0.tar.bz2
fi

tar -xvjf JavaPlot-0.4.0.tar.bz2

mvn deploy:deploy-file \
  -Durl=scpexe://onawh.im/maven \
  -DrepositoryId=ssh-repository \
  -Dfile=./JavaPlot-0.4.0/dist/JavaPlot.jar \
  -DgroupId=com.github.agreementmaker \
  -DartifactId=javaplot \
  -Dversion=0.4.0 \
  -Dpackaging=jar \
  -DgeneratePom=true \
  -DgeneratePom.description="Pure Java programming interface library for GNUPlot - https://sourceforge.net/projects/gnujavaplot"

rm -fR JavaPlot-0.4.0
