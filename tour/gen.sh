#!/bin/sh

for dir in "$@"; do
	pushd $dir

	erect2cubic-5.12 --erect=equi.jpg --ptofile=cube.pto
	nona -o cube cube.pto
	C=0
	for tif in cube*tif; do
		convert $tif -resize 1024x1024 -quality 75 $C.jpg
		let "C+=1"
	done
	rm cube*tif

	popd
done
