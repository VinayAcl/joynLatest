require 'calabash-android/management/adb'

Before do |scenario|

	cc = `adb -s $ANDROID_SERIAL shell input keyevent 3 `
      	
	cc1 = `adb -s $ANDROID_SERIAL2 shell input keyevent 3 `

  return if scenario.failed? #No need to start the server is anything before this has failed.
  cmd = "#{adb_command} shell am instrument -w -e class sh.calaba.instrumentationbackend.InstrumentationBackend #{ENV['TEST_PACKAGE_NAME']}/sh.calaba.instrumentationbackend.CalabashInstrumentationTestRunner"
  log "Starting test server using:"
  log cmd
  if is_windows?
    system(%Q(start /MIN cmd /C #{cmd}))
  else
	#puts "****** command: " + #{cmd} 
    `#{cmd} 1>&2 &`
  end
  
  sleep 2
  begin
    connect_to_test_server
    log "Connection established"
  rescue Exception => e
    log "Exception:#{e.backtrace}"
  end
end



After do |scenario| 

  #disconnect_from_test_server(scenario.failed?)
  disconnect_from_test_server
end
