Pod::Spec.new do |s|
s.name        = 'RouterManager'
s.version     = '0.0.1'
s.authors     = { 'daniulaolu' => '287929070@qq.com' }
s.homepage    = 'https://github.com/MrLujh/RouterManager'
s.summary     = 'a dropdown menu for ios like wechat homepage.'
s.source      = { :git => 'https://github.com/MrLujh/RouterManager.git',
:tag => s.version.to_s }
s.license     = { :type => "MIT", :file => "LICENSE" }

s.platform = :ios, '7.0'
s.requires_arc = true
s.source_files = 'RouterManager/**/*.{h,m}'
s.ios.deployment_target = '7.0'
s.frameworks   =  'UIKit', 'Foundation'
s.dependency 'MJExtension'
end