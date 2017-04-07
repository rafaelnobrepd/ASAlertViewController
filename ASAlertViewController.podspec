#
# Be sure to run `pod lib lint ASAlertViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ASAlertViewController'
  s.version          = '0.1.0'
  s.summary          = 'Alternativa para situações onde queremos usar o UIAlertController mas com conteúdo personalizado.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Alerta customizado e de uso prático para interação com o usuário exibindo junto um conteúdo personalizado.'

  s.homepage         = 'https://github.com/didisouzacosta/ASAlertViewController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Adriano Souza Costa' => 'adriano@adrianosouzacosta.com' }
  s.source           = { :git => 'https://github.com/didisouzacosta/ASAlertViewController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ASAlertViewController/Classes/**/*'

  s.resources = 'ASAlertViewController/Assets/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'TPKeyboardAvoiding'
end
