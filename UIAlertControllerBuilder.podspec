#
# Be sure to run `pod lib lint UIAlertControllerBuilder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name         = 'UIAlertControllerBuilder'
    s.version      = '0.1.0'
    s.summary      = 'Objective-C 链式构建 UIAlertController'
    s.description  = <<-DESC
    UIAlertControllerBuilder 是一个链式调用封装的 UIAlertController 创建器，支持 Alert/ActionSheet、多按钮、文本输入、iPad popover、颜色自定义等。
    DESC

    s.homepage     = 'https://github.com/dabenliu/UIAlertControllerBuilder'
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.author       = { '大笨刘' => 'dabenliu@outlook.com' }
    s.source       = { :git => 'https://github.com/dabenliu/UIAlertControllerBuilder.git', :tag => s.version.to_s }

    s.platform     = :ios, '9.0'
    s.source_files  = 'UIAlertControllerBuilder/Classes/**/*'
    s.requires_arc = true
end
