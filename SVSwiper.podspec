Pod::Spec.new do |s|
  s.name             = 'SVSwiper'
  s.version          = '2.1.1'
  s.summary          = 'SVSwiper framework allows developers to create onboarding screens within a fewer lines of code'
  s.swift_version    = '5.3'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'SVSwiper library provides custom onboarding screens with minimal effort. 
   The library generates the swipable modern looking screen that provides custom 
   experience to the clients of iOS Application.'
                       DESC

  s.homepage         = 'https://github.com/sareenv/SVSwiper'
  s.screenshots     = 'https://raw.githubusercontent.com/sareenv/SVSwiper/master/assets/poster.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vinayak Sareen' => 'contact@sareenv.com' }
  s.source           = { :git => 'https://github.com/sareenv/SVSwiper.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.sareenv.com'
  s.ios.deployment_target = '14.0'
  s.source_files = 'SVSwiper/Classes/**/*.swift'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
