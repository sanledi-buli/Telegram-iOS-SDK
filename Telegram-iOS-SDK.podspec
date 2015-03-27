#
# Be sure to run `pod lib lint Telegram-iOS-SDK.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Telegram-iOS-SDK"
  s.version          = "0.1.0"
  s.summary          = "A short description of Telegram-iOS-SDK."
  s.description      = <<-DESC
                       An optional longer description of Telegram-iOS-SDK

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/Telegram-iOS-SDK"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'GPLv2'
  s.author           = { "Hariton Batkov" => "hariton.batkov@p-product.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/Telegram-iOS-SDK.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '6.0'
  s.requires_arc = 'Pod/Classes/ARC/**/*'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-lstdc++ -ObjC' }
  s.source_files = 'Pod/Classes/**/*'
  s.compiler_flags = '-Wall'
  s.resource_bundles = {
    'Telegram-iOS-SDK' => ['Pod/Assets/*']
  }
  s.frameworks = 'AddressBook', 'AddressBookUI', 'CoreLocation'
  s.dependency 'BLPhoneFormat'
  s.dependency 'BLContactsViewController'   
  s.dependency 'pop'
  s.ios.vendored_library = 'Pod/Libs/**'
  s.dependency 'OpenSSL-Universal', '1.0.1.k'
  s.dependency 'iOS-WebP'
  s.library = 'z'
  #s.dependency 'CocoaAsyncSocket' 
  #s.dependency 'OpenSSL-Universal', '1.0.1.l'
   
end
