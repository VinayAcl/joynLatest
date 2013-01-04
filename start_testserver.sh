#!/bin/sh
adb shell am instrument -w -e class sh.calaba.instrumentationbackend.InstrumentationBackend com.summit.beam.test/sh.calaba.instrumentationbackend.CalabashInstrumentationTestRunner
