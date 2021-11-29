#
# Be sure to run `pod lib lint SwiftyGo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyGo'
  s.version          = '1.0.0'
  s.summary          = 'SwiftyGo is a SwiftUI Coordinator for navigation using only one line code.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
'SwiftyGo is a SwiftUI Coordinator for navigation using only one line code. You can perform all types of navigation in your own SwiftUI project.'
                       DESC

  s.homepage         = 'https://github.com/mobile-simformsolutions/SSSwiftyGo.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "HitarthBhatt12" => "hitarth.b@simformsolutions.com" }
  s.source           = { :git => 'https://github.com/mobile-simformsolutions/SSSwiftyGo.git', :tag => s.version.to_s }
  s.social_media_url = "https://www.linkedin.com/in/hitarth-bhatt"

  s.ios.deployment_target = '13.0'

  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "13.0"
  }
  
  # s.resource_bundles = {
  #   'SwiftyGo' => ['SwiftyGo/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
