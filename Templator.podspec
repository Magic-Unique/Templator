#
# Be sure to run `pod lib lint Templator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Templator'
  s.version          = '0.1.0'
  s.summary          = 'Create a templator project by CommandLine'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
For the features:
- CocoaPods: pod install
- Git: Clone, Clean, Init
- Open: Open file with app
- Replacement: Replace placeholder for specially project infomation
- ...
                       DESC

  s.homepage         = 'https://gitee.com/pica/templator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '冷秋' => '516563564@qq.com' }
  s.source           = { :git => 'https://gitee.com/pica/templator.git', :tag => "#{s.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.osx.deployment_target = '10.10'

  s.subspec 'Main' do |ss|
    ss.source_files = 'Templator/Main/**/*.{h,m}'
  end

  s.subspec 'Core' do |ss|
    ss.source_files = 'Templator/Core/**/*.{h,m}'
    ss.dependency 'Templator/Main'
    ss.dependency 'MUFoundation/MUPath'
    ss.dependency 'CommandLine'
  end

  s.subspec 'Git' do |ss|
    ss.source_files = 'Templator/Git/**/*.{h,m}'
    ss.dependency 'Templator/Core'
  end

  s.subspec 'CocoaPods' do |ss|
    ss.source_files = 'Templator/CocoaPods/**/*.{h,m}'
    ss.dependency 'Templator/Core'
  end

  s.subspec 'Replacement' do |ss|
    ss.source_files = 'Templator/Replacement/**/*.{h,m}'
    ss.dependency 'Templator/Core'
  end

  s.subspec 'Open' do |ss|
    ss.source_files = 'Templator/Open/**/*.{h,m}'
    ss.dependency 'Templator/Core'
  end
  
  # s.resource_bundles = {
  #   'Templator' => ['Templator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
