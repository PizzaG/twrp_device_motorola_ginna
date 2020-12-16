#!/bin/bash

make clean

export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL="C"
. build/envsetup.sh
lunch omni_ginna-eng
mka recoveryimage

echo ""
echo " Recovery Should Be Built"
echo ""
read
