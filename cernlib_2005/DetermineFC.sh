#!/bin/sh

cat > comptest.F <<EOF
      program comptest
      a = 0
      end
EOF

GCCVSN=`cpp -dM comptest.F | grep __VERSION__ | cut -d" " -f3 | cut -c 2`
FC=""
if [ "$GCCVSN" -lt "4" ]
then
  FC=g77
else
  FC=gfortran
fi

if [ "x$FC" != "x" ]
then
  echo "Checking FORTRAN compiler '${FC}' ... \c"
  $FC -c comptest.F >/dev/null 2>&1
  if [ -s comptest.o ]
  then
    echo "success"
  else
    echo "failure"
    FC=""
  fi
fi
rm -f comptest.*

if [ "x$FC" = "x" ]
then
  echo "==================================================================="
  echo "Expected GCC compiler suite not found."
  echo "==================================================================="
  exit 1
fi

export FC
