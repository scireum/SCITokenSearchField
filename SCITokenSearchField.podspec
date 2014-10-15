Pod::Spec.new do |s|
  s.name         = 'SCITokenSearchField'
  s.version      = '1.0.0'
  s.summary      = ''
  s.description   = <<-DESC

                   DESC
  s.homepage     = 'https://github.com/scireum/SCITokenSearchField'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'scireum' => 'info+dev@scireum.de'}
  s.source       = { :git => 'https://github.com/scireum/SCITokenSearchField.git', :tag => "v#{s.version}" }
  s.source_files = 'SCITokenSearchField/**/*.{h,m}'
  s.resources   = ["SCITokenSearchField/**/*.{xib,png}"]
  s.dependency 'FrameAccessor', '~> 1.0'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
end
