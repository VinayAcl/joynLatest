export ADB_DEVICE_ARG="-s ${ANDROID_SERIAL:-"955ED215BB322D218E0059C65A6D128"}"
export ADB_DEVICE_ARG2="-s ${ANDROID_SERIAL2:-"38E36136411CBE01882C4B4E9A222CA"}"

wsdir=$WORKSPACE/results

cucumber -c -v features/chat.feature --backtrace --color --format pretty --format junit --out $wsdir --format html --out $wsdir/cucumber-reports-chat.html -f usage --out $wsdir/usage.txt PACKAGE_NAME=com.summit.beam TEST_PACKAGE_NAME=com.summit.beam.test TEST_APP_PATH=features/support/Test.apk TEST_SERVER_PORT=${CFG_TEST_SERVER_PORT:-34777} TEST_SERVER_PORT2=${CFG_TEST_SERVER_PORT2:-34778}


