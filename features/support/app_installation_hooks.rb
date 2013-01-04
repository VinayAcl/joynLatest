require 'calabash-android/management/app_installation'

AfterConfiguration do |config|
	FeatureNameMemory.feature_name = nil
end

Before do |scenario|
  feature_name = scenario.feature.name

  if FeatureNameMemory.feature_name != feature_name
    log "Is first scenario - reinstalling apps"
#    uninstall_apps

    log `#{adb_command} uninstall #{ENV["TEST_PACKAGE_NAME"]}`
    install_app(ENV["TEST_APP_PATH"])
#    install_app(ENV["APP_PATH"])
    FeatureNameMemory.feature_name = feature_name
	end
end

at_exit do
#	uninstall_apps
end

FeatureNameMemory = Class.new
class << FeatureNameMemory
  @feature_name = nil
  attr_accessor :feature_name
end
