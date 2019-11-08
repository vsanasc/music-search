# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
use_frameworks!

def common_pods
  pod "PromiseKit", "~> 6.8"
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
end

def test_pods
  pod 'Mockingjay', '3.0.0-alpha.1'
end


target 'MusicSearch' do
  common_pods
end

target 'MusicSearchTests' do
  common_pods
end
