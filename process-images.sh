#!/bin/bash

maxSize=1400
imgDir=static/images
files=$(ls -p $imgDir/*.*)

echo checking $(ls -1 $imgDir/*.* | wc -l) files

OIFS="$IFS"
IFS=$'\n'

for file in `find $imgDir/*.* -type f`
do

	original=$(basename -- "$file")
	echo -n .
	filename=${original%.*}

	lqip="$imgDir/lqip/$filename.svg"

	# exiftool -q "$file" -if '$ImageWidth > 1400 || $ImageHeight > 1400 and !print "$Directory/$Filename\0"' | xargs -0 -R 2 -I "%" echo "%"
	# xargs -0 -R 2 -I "%" convert -resize "$maxSizex$maxSize>" "%" "%"

	width=$(identify -format "%w" "$imgDir/$original")
	height=$(identify -format "%h" "$imgDir/$original")

	if (( $width > $maxSize )) || (( $height > $maxSize )); then
		echo \n$original was $width x $height
		echo convert \"$imgDir/$original\" -resize ${maxSize}x${maxSize}\> \"$imgDir/$original\"
		convert "$imgDir/$original" -resize ${maxSize}x${maxSize}\> "$imgDir/$original"
		width2=$(identify -format "%w" "$imgDir/$original")
		height2=$(identify -format "%h" "$imgDir/$original")
		echo $original is now $width2 x $height2
	fi


	if test -f $lqip; then

		a=$(stat -f "%Um" "$imgDir/$original")
		b=$(stat -f "%Um" "$lqip")

		if [ $a \> $b ]; then
			echo "\n$original is younger than lqip/$filename.svg"
			sqip -i $file -n 100 -b 12 --silent -o "$lqip"
		fi
	else
		echo "\n$lqip doesn't exist"
		sqip -i $file -n 100 -b 12 --silent -o "$lqip"
	fi


done

IFS="$OIFS"
