Pod::Spec.new do |s|
  s.name         = "IVGUtils"
  s.version      = "1.0.7"
  s.summary      = "Miscellaneous helper routines for iOS"
  s.homepage     = "https://github.com/ivygulch/IVGUtils"
  s.license      = { :type => 'MIT', :file => 'LICENSE'}
  s.author       = { "dwsjoquist" => "dwsjoquist@sunetos.com"}
  s.source       = { :git => "https://github.com/ivygulch/IVGUtils.git", :tag => "v1.0.7" }
  s.platform     = :ios, '7.0'
  s.source_files = 'IVGUtils/source/*{.h,.m}'
  s.frameworks   = 'Foundation','UIKit','CoreGraphics','QuartzCore'
  s.requires_arc = true
end
