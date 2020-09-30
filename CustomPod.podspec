Pod::Spec.new do |s|
    s.name             = 'CustomPod'
    s.version          = '0.1.0'
    s.summary          = 'A custompod for checking the working for cocoapods.'
    
    s.description      = <<-DESC
    'A custompod for checking the working for cocoapods by creating demo pod'
    DESC
    
    s.homepage         = 'https://github.com/mandardev/CustomPod'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'mandar.developer7@gmail.com' => 'mandar.developer7@gmail.com' }
    s.source           = { :git => 'https://github.com/mandardev/CustomPod.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '11.0'
    
    s.source_files = 'CustomPod/Classes/**/*'
    
    s.static_framework = true
    
    s.dependency 'OpenTok'
    s.dependency 'Alamofire', '~> 5.2'
    s.dependency 'RxSwift', '~> 5.1.1'
    s.dependency 'RxCocoa', '~> 5.1.1'
    s.dependency 'RxRelay', '~> 5.1.1'
    s.dependency 'ObjectMapper', '~> 4.2.0'
    
    s.resource_bundles = {
        'CustomPod' => ['CustomPod/Assets/*']
    }
    
    s.resources = "CustomPod/**/*.{png,json}"

        
end
