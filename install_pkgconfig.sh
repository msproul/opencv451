##########################################################
#	now time to install the pkg-config file  opencv4.pc
##########################################################
PKGCONFIGFILE="opencv4.pc"
if [ -f $PKGCONFIGFILE ]
then
	echo "Looking to see if $PKGCONFIGFILE is already installed"
	sudo find /usr -name $PKGCONFIGFILE
	PKGCNT=`sudo find /usr -name $PKGCONFIGFILE | wc -l`
	if [ $PKGCNT -gt 0 ]
	then
		echo "$PKGCONFIGFILE is already installed"
	else
		echo "copying $PKGCONFIGFILE to "
		sudo cp $PKGCONFIGFILE /usr/lib/pkgconfig/
	fi
else
	echo "$PKGCONFIGFILE is missing"
fi
echo
echo "**************************************"
echo "Checking pkg-config for opencv4"
pkg-config --cflags opencv4
pkg-config --libs opencv4

