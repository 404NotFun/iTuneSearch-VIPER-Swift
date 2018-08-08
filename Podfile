source "https://github.com/CocoaPods/Specs"
platform :ios, '9.0'
target 'M800_assignment' do
    use_frameworks!
    #UI/Animation
    pod 'ESPullToRefresh'
    #Networking
    pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git', :tag => '4.1.0'
    pod 'AlamofireObjectMapper'
    #Image
    pod 'SDWebImage'
    #Alert
    #pod 'SCLAlertView-Objective-C'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |configuration|
            # these libs work now only with Swift3.2 in Xcode9
            if ['ObjectMapper'].include? target.name
                configuration.build_settings['SWIFT_VERSION'] = "3.2"
            end
        end
    end
end
