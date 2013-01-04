
Given /^joyn app is running on the First Device$/ do
    begin
        setKPIIdentifier()
        startTime = Time.now.to_f
        performAction('wait_for_view_by_id','contacts_toggle_filter_txtview', true)
        waitTillViewIsShown('contacts_toggle_filter_txtview', 120)
        elapsedTime = Time.now.to_f - startTime
        puts "KPI: Startup Time|Startup time for app till the joyn contacts being displayed;opco="+$opco1_str+";imsi="+$imsi1_str+";time="+elapsedTime.to_s+"s"
    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end

Given /^also in Second Device joyn app is running$/ do
    begin
    log `#{adb_command} uninstall #{ENV["TEST_PACKAGE_NAME"]}`
    install_app(ENV["TEST_APP_PATH"])
    cmd = "#{adb_command} shell am instrument -w -e class sh.calaba.instrumentationbackend.InstrumentationBackend #{ENV['TEST_PACKAGE_NAME']}/sh.calaba.instrumentationbackend.CalabashInstrumentationTestRunner"
    log "Starting test server using:"
    log cmd
      if is_windows?
         system(%Q(start /MIN cmd /C #{cmd}))
      else
         `#{cmd} 1>&2 &`
      end
    connect_to_test_server
    #result = performAction('get_imsi')
    #imsi = result["bonusInformation"].to_s
    #puts "IMSI 2: " + imsi
    setKPIIdentifier()
    startTime = Time.now.to_f
    performAction('wait_for_view_by_id','contacts_toggle_filter_txtview', true)
    waitTillViewIsShown('contacts_toggle_filter_txtview', 120)
    elapsedTime = Time.now.to_f - startTime
    puts "KPI: Startup Time|Startup time for app till the joyn contacts being displayed;opco="+$opco2_str+";imsi="+$imsi2_str+";time="+elapsedTime.to_s+"s"
    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end


When /^I see the contact '(.*)' in joyn contacts list$/ do |contact|
    begin
#puts "DDDDDDD Vinay: " + contact
     performAction('wait_for_view_by_id','contacts_toggle_filter_btn', true)
     waitTillViewIsShown('contacts_toggle_filter_btn', 120)
     begin
        sleep 1
        r = performAction('read_text_for_view_by_id','contacts_toggle_filter_txtview')
        current = r["bonusInformation"].to_s
     end while ( current != '["joyn contacts"]' ) and performAction('click_on_view_by_id','contacts_toggle_filter_btn')
  
     performAction('wait_for_text', contact)
    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end     

Then /^I select the contact '(.*)' in joyn contacts list$/ do |contact|
    begin
#puts "Vinay: " + contact
        performAction('click_on_text',contact)
    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end     

When /^I start to chat with  the contact$/ do 
    begin
     performAction('click_on_text','Chat')
     waitTillViewIsShown('chat_composer', 120)
     sleep 1
    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end     

Then /^I send the chat message '(.*)' to other contact$/ do |message|
    begin
    performAction('enter_text_into_view_by_id','chat_composer',message)
    if $device == 1 then
        
        $startTimeSendMessage1 = Time.now.to_f
#puts '$$$$$$$$$$$$ setting startTimeSendMessage1' + $startTimeSendMessage1.to_s
    elsif $device == 2 then

	#puts '$$$$$$$$$$$$ setting from  current time= ' + Time.now.to_f.to_s
        $startTimeSendMessage2 = Time.now.to_f

#puts '$$$$$$$$$$$$ setting startTimeSendMessage2= ' + $startTimeSendMessage2.to_s

    end
    performAction('click_on_view_by_id','chat_send_button')
    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end    

Then /^I open the main chat history page$/ do
    begin
    performAction('click_on_view_by_id','main_chat_history_button')
    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end     

And /^I clear the chat history with last message '(.*)'$/ do |last_message|
    begin
    r = performAction('read_visibility_for_view_by_id', 'chat_history_no_message')
    info = r["bonusInformation"]
    if info != nil && info.to_s == 'false' then
        r = performAction('read_text_for_view_by_id', 'history_row_message')
        text = r["bonusInformation"]
        if text != nil && (text.to_s <=> last_message) > -1 then
            performAction('press_long_on_text_and_select_with_index', last_message, 2)
            performAction('press_button_with_text','Delete')
        end
    end
    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end

Then /^I wait to see message text '([^\"]*)'$/ do |text|
    begin
    performAction('wait_for_text', text)
    
    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end


Then /^I wait to see the ack sign$/ do
    begin

count = 1
info1 = 'NOT'
until info1.include?'FOUND'
    puts info1
    r = performAction('isJoynCheckBoxPresent')
    info = r["bonusInformation"]
    if info != nil then
        info1 = info.to_s
    end

	timeoutInSec=20
	unitInSec=10
	sleep(1.0/unitInSec)
	if count >= (timeoutInSec*unitInSec)
		puts 'Joyn chat message delivery notification did not recived in 20 seconds'
		performAction('time_out_exit',1)
	else
		count = count + 1
	end

end
puts info1

    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end 

And /^I take a screenshot in all devices$/ do
	take_error_screenshots
end

def waitTillViewIsShown(viewId, timeOut)
    endTime = Time.now.to_f + timeOut.to_f
    begin
        sleep 0.5
        r = performAction('read_visibility_for_view_by_id', viewId)
        info = r["bonusInformation"].to_s
    end while info == 'false' && Time.now.to_f < endTime.to_f
    if info == 'false' then
        assert(false ,'View with id ' + viewId + ' was not able to show up in time')
    end
    return false
end

def setKPIIdentifier()
    result = performAction('get_imsi')
    imsi = result["bonusInformation"].to_s

    if $device == 1 then
        $opco1_str = getOpco(imsi)
        $imsi1_str = imsi
    elsif $device == 2 then
        $opco2_str = getOpco(imsi)
        $imsi2_str = imsi
    end
end

def getOpco(imsi)
    case imsi[0,3]
        when '262'
            return 'de'
        when '268'
            return 'pt'
        when '222'
            return 'it'
        when '204'
            return 'nl'
        when '214'
            return 'es'
        when '234' || '235'
            return 'gb'
        when '272'
            return 'ir'
        when '202'
            return 'gr'
        else
            return 'no_opco'
    end
end


Then /^I wait for (\d*) seconds for Joyn Notification$/ do | timeInSeconds |
begin

        response = ''
	if $device == 1 then
		ss = './notify.sh $ANDROID_SERIAL ' + timeInSeconds
               
 		IO.popen ss do |f|
			until f.eof?
			      
			      response = response +  f.gets
			end
		      #puts '$$$$$$ cmd Response: ' + response	
    		end
	elsif $device == 2 then
		ss = './notify.sh $ANDROID_SERIAL2 ' + timeInSeconds
		
		IO.popen ss do |f|
			until f.eof?
			      response = response +  f.gets
			end
		#puts '$$$$$$ cmd Response: ' + response
    		end
	end

	if response.include?('com.summit.beam') == false
            raise "Joyn Notifications was not received"
        end 

if $device == 1 then
	#puts '$$$$$$$$$$$$ calculating from  startTimeSendMessage2= ' + $startTimeSendMessage2.to_s
#sleep(2)
	#puts '$$$$$$$$$$$$ calculating from  current time= ' + Time.now.to_f.to_s

        elapsedTime = Time.now.to_f - $startTimeSendMessage2
        puts "KPI: Message Transfer Time|Sent time for the message received by the first device;opco="+$opco1_str+";imsi="+$imsi1_str+";time="+elapsedTime.to_s+"s"
    elsif $device == 2 then
#puts '$$$$$$$$$$$$ calculating from  startTimeSendMessage1' + $startTimeSendMessage1.to_s
        elapsedTime = Time.now.to_f - $startTimeSendMessage1
        puts "KPI: Message Transfer Time|Sent time for the message received by the second device;opco="+$opco2_str+";imsi="+$imsi2_str+";time="+elapsedTime.to_s+"s"
    end


    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end


Then /^I ensure that no prior notifications are present on both devices$/ do 
    begin
	cc = `adb -s $ANDROID_SERIAL logcat -b events -c `
      	
	cc1 = `adb -s $ANDROID_SERIAL2 logcat -b events -c `
      	 
       #steps %{
#		Then I clear prior notifications
#		Then I clear prior notifications in Second Device
#       }

        #performAction('clear_notification')
    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end     


Then /^I clear prior notifications$/ do 
    begin
        performAction('clear_notification')
    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end     


Then /^I open Joyn Notification$/ do
    begin

    if $device == 1 then
 	cc = `monkeyrunner ./test.py User $ANDROID_SERIAL`
   	cc = `adb -s $ANDROID_SERIAL logcat -b events -c `
    elsif $device == 2 then
 	cc = `monkeyrunner ./test.py Plane $ANDROID_SERIAL2`
	cc = `adb -s $ANDROID_SERIAL2 logcat -b events -c `
    end

    rescue Calabash::Android::Operations::OperationsError => oe
        raise oe
    rescue Exception => e
        take_error_screenshots
        raise e
    end
end

