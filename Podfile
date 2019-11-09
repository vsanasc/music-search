
platform :ios, '11.4'
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
  pod 'SwiftLint'
end

target 'MusicSearchIOS' do
  pod 'Kingfisher'
  common_pods
end

target 'MusicSearchKit' do
  pod 'Mockingjay', '3.0.0-alpha.1'
  common_pods
end

target 'MusicSearchIOSTests' do
  test_pods
  common_pods
end

target 'MusicSearchKitTests' do
  test_pods
  common_pods
end


