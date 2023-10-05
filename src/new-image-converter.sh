#!/bin/bash

convert_image() {
	local image_path=$1
	local clean_image=$(ls $image_path | awk -F. '{ print $1 }')
	convert $clean_image.jpg $clean_image.png
}

scan_directory() {
	cd $1
	for image in *
	do
		local image_path=$(find ~/teste/Scripts/images/imagens-novos-livros -name $image)
		if [ -d $image_path ]
		then
			scan_directory $image_path
		else
			convert_image $image_path
		fi
	done
}

scan_directory ~/teste/Scripts/images/imagens-novos-livros
if [ $? -eq 0 ]
then
	echo "Conversion was successful!"
else
	echo "An error occurred, conversion has failed."
fi
