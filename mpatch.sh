#!/bin/bash
#0
echo "Welcome to our team - Gayzu dev"

#--------------------------------------------------------------------------------------------
#Script by TDADS																			|
#echo "Enter repo folder name (folder name where crDroid/lineage sources is located)"       |
#read sourcespath																			|
#cd "~/$sourcespath"																		|
#--------------------------------------------------------------------------------------------

ROOTDIR="$PWD"
cd "$PWD"
#1
echo "patch BpfUtils.cpp 1 of 4"
cp BpfUtilscpp.patch system/bpf/libbpf_android/
cd system/bpf/libbpf_android/
patch BpfUtils.cpp < BpfUtilscpp.patch
rm BpfUtilscpp.patch
# patch source: 'BpfUtilscpp.patch', target: "system/bpf/libbpf_android/BpfUtils.cpp"
#2
echo "patch build/soong/Android.bp 2 of 4"
cd "$ROOTDIR"
cp Androidbp.patch vendor/rr/build/soong/
cd vendor/rr/build/soong/
patch Android.bp < Androidbp.patch
rm Androidbp.patch
#patch source: 'Androidbp.patch', target: "vendor/rr/build/soong/Android.bp"
#3
cd "$ROOTDIR"
echo "patch BoardConfigKernel.mk 3 of 4"
cp BoardConfigKernel.patch vendor/rr/config/
cd vendor/rr/config/
patch BoardConfigKernel.mk < BoardConfigKernel.patch
rm BoardConfigKernel.patch
#patch source: 'BoardConfigKernel.patch', target: "vendor/rr/config/BoardConfigKernel.mk"
#4
cd "$ROOTDIR"
echo "patch BoardConfigSoong.mk 4 of 4"
cp BoardConfigSoong.patch vendor/rr/config/
cd vendor/rr/config/
patch BoardConfigSoong.mk < BoardConfigSoong.patch
rm BoardConfigSoong.patch
#patch source: 'BoardConfigSoong.patch', target: "vendor/rr/config/BoardConfigSoong.mk"
#5
cd "$ROOTDIR"
echo "done, you are welcome motherfucker"
