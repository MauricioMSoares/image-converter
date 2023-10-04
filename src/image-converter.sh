#!/bin/bash

convert_image() {
cd ~
IMAGE_PATH=$(find ./ -type d -name imagens-livros)
cd $IMAGE_PATH

if [ ! -d imagens-png ] 
then
	mkdir imagens-png
fi

for image in *.jpg
do
	local clean_image=$(ls $image | awk -F. '{ print $1 }')
	convert $clean_image.jpg imagens-png/$clean_image.png
done
}

convert_image 2>>error_log.txt

if [ $? -eq 0 ]
then
	echo "Successfully converted!"
else
	echo "Conversion failed."
fi
