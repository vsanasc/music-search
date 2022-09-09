
platform :ios, '14'
use_frameworks!

def common_pods
  pod "PromiseKit"
  pod 'RxSwift'
  pod 'RxCocoa'
end

def test_pods
  pod 'Mockingjay', :git => 'https://github.com/kylef/Mockingjay.git'
end


target 'MusicSearch' do
  pod 'SwiftLint'
end

target 'MusicSearchIOS' do
  pod 'Kingfisher'
  common_pods
end

target 'MusicSearchKit' do
  pod 'Mockingjay', :git => 'https://github.com/kylef/Mockingjay.git'
  common_pods
end

target 'MusicSearchIOSTests' do
  inherit! :search_paths
  test_pods
  common_pods
end

target 'MusicSearchKitTests' do
  inherit! :search_paths
  test_pods
  common_pods
end


