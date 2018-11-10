#
# Be sure to run `pod lib lint AzureClientRuntime.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AzureClientRuntime'
  s.version          = '0.1.5'
  s.summary          = 'Provides comuniction with Azure RESTful server.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Use this pod as a dependency for a library generated with the AutoRest ObjC generator.
                       DESC

  s.homepage         = 'https://github.com/vladimir-shcherbakov/azure-runtime-client-for-objectiveC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vladimir-shcherbakov' => 'vlashch@microsoft.com' }
  s.source           = { :git => 'https://github.com/vladimir-shcherbakov/azure-runtime-client-for-objectiveC.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'AzureClientRuntime/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AzureClientRuntime' => ['AzureClientRuntime/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
