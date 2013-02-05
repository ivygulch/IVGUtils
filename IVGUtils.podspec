Pod::Spec.new do |s|
  s.name         = "IVGUtils"
  s.version      = "0.0.1"
  s.summary      = "Miscellaneous helper routines for iOS"
  s.homepage     = "http://github.com/ivygulch/IVGUtils"
  s.license      = { :type => 'MIT', :file => 'LICENSE'}
  s.author       = { "dwsjoquist" => "dwsjoquist@sunetos.com"}
  s.source       = { :git => "https://github.com/ivygulch/IVGDownloadManager.git" }
  s.platform     = :ios, '5.0'
  s.source_files = 'IVGUtils/LibClasses'
  s.frameworks   = 'Foundation','UIKit','CoreData','CoreGraphics'
  s.requires_arc = true
end
