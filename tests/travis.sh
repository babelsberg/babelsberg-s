$BUILDER_CI_HOME/testTravisCI.sh -verbose
exitcode=$?

if [ $exitcode -eq 0 ]; then
    if [ "$ST" == "Squeak-4.5" ]; then
	set -x
	echo Uploading $BUILDER_CI_HOME/images/*.image
	# cp $BUILDER_CI_HOME/images/*.image BabelsbergS.image
	cd $PROJECT_HOME
	echo $PWD
	cp $BUILDER_CI_HOME/images/*.image BabelsbergS.image
	cp $BUILDER_CI_HOME/images/*.changes BabelsbergS.changes
	cp $BUILDER_CI_HOME/sources/*.sources .
	echo "$VM_PATH/Linux/squeak -nosound -plugins "$VM_PATH/Linux" -encoding Latin1 -nodisplay BabelsbergS.image"
	$VM_PATH/Linux/squeak -nosound -plugins "$VM_PATH/Linux" -encoding Latin1 -nodisplay BabelsbergS.image tests/build_image.st
	echo "uploading..."
	curl -T BabelsbergS.image http://www.lively-kernel.org/babelsberg/
	curl -T BabelsbergS.changes http://www.lively-kernel.org/babelsberg/
    fi
fi
exit $exitcode
