$BUILDER_CI_HOME/testTravisCI.sh -verbose
exitcode=$?

if [ $exitcode -eq 0 ]; then
    set -x
    echo Uploading $BUILDER_CI_HOME/images/*.image
    cd $PROJECT_HOME
    echo $PWD
    cp $BUILDER_CI_HOME/images/*.image BabelsbergS.image
    cp $BUILDER_CI_HOME/images/*.changes BabelsbergS.changes
    cp $BUILDER_CI_HOME/sources/*.sources .
    echo "$VM_PATH/Linux/squeak -nosound -plugins "$VM_PATH/Linux" -encoding Latin1 -nodisplay BabelsbergS.image"
    $VM_PATH/Linux/squeak -nosound -plugins "$VM_PATH/Linux" -encoding Latin1 -nodisplay BabelsbergS.image tests/build_image.st
    echo "uploading..."
    curl -T BabelsbergS.image http://www.lively-kernel.org/babelsberg/BabelsbergS/
    curl -T BabelsbergS.changes http://www.lively-kernel.org/babelsberg/BabelsbergS/
fi
exit $exitcode
