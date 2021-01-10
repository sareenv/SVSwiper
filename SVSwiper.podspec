#
# Be sure to run `pod lib lint SVSwiper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SVSwiper'
  s.version          = '0.1.0'
  s.summary          = 'SVSwiper framework allows users to have navigation within a single Controller'
  s.swift_version    = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'SVSwiper framework allows users to have navigation within a single controller. This library has delegate methods which allows users to customise the navigation options such as menubar tintColor, titles for controllers and other properties'
                       DESC

  s.homepage         = 'https://github.com/sareenv/SVSwiper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vinayak' => 'sareenv026@outlook.com' }
  s.source           = { :git => 'https://github.com/sareenv/SVSwiper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'SVSwiper/Classes/**/*.swift'
  
  # s.resource_bundles = {
  #   'SVSwiper' => ['SVSwiper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
