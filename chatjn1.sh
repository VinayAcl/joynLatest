#!/bin/sh

export ADB_DEVICE_ARG="-s ${ANDROID_SERIAL:-"955ED215BB322D218E0059C65A6D128"}"
export ADB_DEVICE_ARG2="-s ${ANDROID_SERIAL2:-"38E36136411CBE01882C4B4E9A222CA"}"

#date time stamp
dts() { date +%Y-%m-%d-%H-%M-%S; }

dmkdir() { local newdir="$@/$(dts)"; mkdir $newdir && echo $newdir; }

newdir="$(dmkdir final)"

#echo $newdir
#export SCREENSHOT_PATH=./$newdir/
#echo $SCREENSHOT_PATH

cucumber -c -v features/chat.feature --backtrace --color --format pretty --format junit --out results --format html --out results/cucumber-reports-chat.html -f usage --out results/usage.txt PACKAGE_NAME=com.summit.beam TEST_PACKAGE_NAME=com.summit.beam.test TEST_APP_PATH=features/support/Test.apk TEST_SERVER_PORT=${CFG_TEST_SERVER_PORT:-34777} TEST_SERVER_PORT2=${CFG_TEST_SERVER_PORT2:-34778}

#cp results/* $WORKSPACE/results
cp results/* $newdir

