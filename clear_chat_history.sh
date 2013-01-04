rm -rf results
export ADB_DEVICE_ARG="-s ${ANDROID_SERIAL:-"955ED215BB322D218E0059C65A6D128"}"
export ADB_DEVICE_ARG2="-s ${ANDROID_SERIAL2:-"38E36136411CBE01882C4B4E9A222CA"}"

echo $ADB_DEVICE_ARG
echo $ADB_DEVICE_ARG2

cucumber -c -v features/clear_chat_history.feature --backtrace --color --format pretty --format junit --out results --format html --out results/cucumber-reports-clear_chat_history.html PACKAGE_NAME=com.summit.beam TEST_PACKAGE_NAME=com.summit.beam.test TEST_APP_PATH=features/support/Test.apk TEST_SERVER_PORT=${CFG_TEST_SERVER_PORT:-34777} TEST_SERVER_PORT2=${CFG_TEST_SERVER_PORT2:-34778}
