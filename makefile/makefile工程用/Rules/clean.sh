#!/bin/sh
echo $OBJ_DIR
for i in $OBJ_DIR
do
	make --no-print-directory -C $i clean
done 
