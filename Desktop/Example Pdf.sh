#!/bin/sh

cd ~/Desktop

if [ ! -f pdfreference1.7old.pdf ] ; then
	# We can’t include this PDF due to copyright issues, but we can download it for you.
	pro -O https://opensource.adobe.com/dc-acrobat-sdk-docs/pdfstandards/pdfreference1.7old.pdf
fi

open pdfreference1.7old.pdf
