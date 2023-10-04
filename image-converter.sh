#!/bin/bash

cd ~
IMAGE_PATH=$(find ./ -type d -name imagens-livros)
cd $IMAGE_PATH

if [ ! -d imagens-png ] 
then
	mkdir imagens-png
fi

for image in *.jpg
do
	clean_image=$(ls $image | awk -F. '{ print $1 }')
	convert $clean_image.jpg imagens-png/$clean_image.png
done
