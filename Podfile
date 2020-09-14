# Uncomment this line to define a global platform for your project
platform :ios, '13.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'QRCodeScanner' do
    pod 'Firebase/Core'
    pod 'Firebase/Analytics'

end


#Continuous integration sirasinda olusan hatanin cozumu icin kullaniliyor.
#http://devcenter.bitrise.io/docs/cocoapods-frameworks-signing-issue
###################

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['SWIFT_VERSION'] = '5.0'
      config.build_settings.delete('CODE_SIGNING_ALLOWED')
      config.build_settings.delete('CODE_SIGNING_REQUIRED')
      config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
      
    end
  end
end

