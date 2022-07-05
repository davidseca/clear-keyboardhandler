#
#  Be sure to run `pod spec lint KeyboardHandler.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name = "ClearKeyboardHandler"
  spec.version = "0.0.1"
  spec.summary = "A clear KeyboardHandler."
  spec.description = <<-DESC
  David Seca - just clear
  Clear KeyboardHandler provides an easy way to manage Keyboard handlig
  DESC

  spec.homepage = "http://davidseca.website2.me"

  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.author = { "David Seca" => "davidseca@gmail.com" }

  spec.platform = :ios
  spec.ios.deployment_target = '14.0'
  spec.swift_versions = [ '5.0' ]

  spec.source = { :git => "git@github.com:davidseca/clear-keyboardhandler.git", :tag => "#{spec.version}" }
  spec.source_files = "ClearKeyboardHandler/**/*.{swift}"

  spec.framework = "UIKit"

end
