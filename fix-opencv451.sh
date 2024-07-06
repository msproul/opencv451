###############################################################################
#	This script fixes the file gapi_async_test.cpp which will not compile
###############################################################################
TEMP_FILE="fixed_file.cpp"
BAD_FILE="opencv/opencv-4.5.1/modules/gapi/test/gapi_async_test.cpp"

echo "Fixing $BAD_FILE"

ISFIXEDCOUNT=`grep "#include" $BAD_FILE | grep thread | wc -l`


echo $ISFIXEDCOUNT

if [ $ISFIXEDCOUNT -gt 0 ]
then
	echo "File is already fixed"
	grep "#include" $BAD_FILE | grep thread
else
	echo "The file has not been fixed, working on that now"


	echo "#include <thread>"  > $TEMP_FILE

	cat $BAD_FILE >> $TEMP_FILE
	mv $BAD_FILE  bad_gapi_async_test.cpp
	mv $TEMP_FILE $BAD_FILE

	ISFIXEDCOUNT=`grep "#include" $BAD_FILE | grep thread | wc -l`
	if [ $ISFIXEDCOUNT -gt 0 ]
	then
		echo "File fixed succesuflly"
	else
		echo "The file has not been fixed, Somthing is wrong"
	fi
fi

