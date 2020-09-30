#
# Be sure to run `pod lib lint CustomPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CustomPod'
  s.version          = '0.1.0'
  s.summary          = 'A custompod for checking the working for cocoapods.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'A custompod for checking the working for cocoapods by creating demo pod'
                       DESC

  s.homepage         = 'https://github.com/mandardev/CustomPod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mandar.developer7@gmail.com' => 'mandar.developer7@gmail.com' }
  s.source           = { :git => 'https://github.com/mandardev/CustomPod.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CustomPod/Classes/**/*'
  
  s.static_framework = true
  
  s.dependency 'OpenTok'
  s.dependency 'Alamofire', '~> 5.2' #, :git => 'https://github.com/Alamofire/Alamofire.git', :branch => 'alamofire5'
  s.dependency 'RxSwift', '~> 5.1.1'
  s.dependency 'RxCocoa', '~> 5.1.1'
  s.dependency 'RxRelay', '~> 5.1.1'
  s.dependency 'ObjectMapper', '~> 4.2.0'
  
  # s.resource_bundles = {
  #   'CustomPod' => ['CustomPod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
