#
# Be sure to run `pod lib lint SquishyButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SquishyButton'
  s.version          = '0.2.0-beta1'
  s.summary          = 'Button with spring animation.'

  s.description      = <<-DESC
This button is animated when be pushed and be released.
                       DESC

  s.homepage         = 'https://github.com/malt03/SquishyButton'
  s.screenshots      = 'https://raw.githubusercontent.com/malt03/SquishyButton/master/Screenshot.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Koji Murata' => 'malt.koji@gmail.com' }
  s.source           = { :git => 'https://github.com/malt03/SquishyButton.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SquishyButton/Classes/**/*'
end
