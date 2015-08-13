Pod::Spec.new do |s|
  s.name             = "SwiftExtLib"
  s.version          = "0.0.1"
  s.summary          = "Swift extension library."
  s.homepage         = "https://github.com/Hejki/SwiftExtLib.git"
  s.license          = 'Apache License, Version 2.0'
  s.author           = { "Hejki" => "hejki@me.com" }
  s.source           = { :git => "https://github.com/Hejki/SwiftExtLib.git", :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true
  s.source_files = 'src/*.swift'
end
