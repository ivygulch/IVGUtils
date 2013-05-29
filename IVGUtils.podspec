Pod::Spec.new do |s|
  s.name         = "IVGUtils"
  s.version      = "1.0.0"
  s.summary      = "Miscellaneous helper routines for iOS"
  s.homepage     = "http://github.com/ivygulch/IVGUtils"
  s.license      = { :type => 'MIT', :file => 'LICENSE'}
  s.author       = { "dwsjoquist" => "dwsjoquist@sunetos.com"}
  s.source       = { :git => "git@github.com:ivygulch/IVGUtils.git" }
  s.platform     = :ios, '5.0'
  s.source_files = 'LibClasses/*{.h,.m}'
  s.frameworks   = 'Foundation','UIKit','CoreGraphics','QuartzCore'
  s.requires_arc = true
end
