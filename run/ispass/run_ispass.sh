#!/bin/bash

if [ ! -n "$1" ]; then
	echo "usage: $0 BENCHNAME"
	exit 0
fi

BENCH=$1
ISPASS_DIR=~/workspace/gpgpu-bench/ispass2009
ISPASS_BIN=~/workspace/gpgpu-bench/ispass2009/bin/release

BIN=""
DSET=""
IDATA=""
ODATA=""
PAR=""

case "$BENCH" in
	AES) 
	BIN="${ISPASS_BIN}/AES"
	IDATA="e 128 ${ISPASS_DIR}/AES/data/output.bmp ${ISPASS_DIR}/AES/data/key128.txt"
	;;
	BFI)
	BIN="${ISPASS_BIN}/BFS"
	IDATA="${ISPASS_DIR}/BFS/data/graph4096.txt"
	;;
	CP)
	BIN="${ISPASS_BIN}/CP"
	;;
	LIB)
	BIN="${ISPASS_BIN}/LIB"
	;;
	LPS)
	BIN="${ISPASS_BIN}/LPS"
	;;
	MUM)
	BIN="${ISPASS_BIN}/MUM"
	IDATA="${ISPASS_DIR}/MUM/data/NC_003997.20k.fna ${ISPASS_DIR}/MUM/data/NC_003997_q25bp.50k.fna"
	;;
	NN)
	BIN="${ISPASS_BIN}/NN"
	PAR="28"
	;;
	NQU)
	BIN="${ISPASS_BIN}/NQU"
	;;
	RAY)
	BIN="${ISPASS_BIN}/RAY"
	PAR="32 32"
	;;
	STO)
	BIN="${ISPASS_BIN}/STO"
	;;
	WP)
	echo "10 ${ISPASS_DIR}/WP/data/" | ${ISPASS_BIN}/WP
	;;
	*)
	echo "Invalid benchmark name!!"
	;;
esac

echo "${BIN} ${IDATA} ${ODATA} ${PAR}"
${BIN} ${IDATA} ${ODATA} ${PAR} >> gpugj.rpt
