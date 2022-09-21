#
# Be sure to run `pod lib lint SVSwiper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SVSwiper'
  s.version          = '0.1.1'
  s.summary          = 'SVSwiper framework allows developers to create onboarding screens within a fewer lines of code'
  s.swift_version    = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'SVSwiper library uses core UIKit components and provides custom onboarding screens with many customisation options.'
                       DESC

  s.homepage         = 'https://github.com/sareenv/SVSwiper'
  s.screenshots     = 'https://raw.githubusercontent.com/sareenv/SVSwiper/master/assets/poster.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vinayak Sareen' => 'contact@sareenv.com' }
  s.source           = { :git => 'https://github.com/sareenv/SVSwiper.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.sareenv.com'
  s.ios.deployment_target = '11.0'
  s.source_files = 'SVSwiper/Classes/**/*.swift'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
