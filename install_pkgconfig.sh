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
		cp $PKGCONFIGFILE /usr/lib/pkgconfig/
	fi
else
	echo "$PKGCONFIGFILE is missing"
fi

