source 'https://cdn.cocoapods.org/'

platform :ios, '11.0'
inhibit_all_warnings!
use_frameworks!
workspace 'TheFeels'

plugin 'cocoapods-keys', {
  :project => "TheFeels",
  :keys => [
  "TwitterApiKey",
  "TwitterApiKeySecret",
  "TwitterBearerToken",
  ]}

def firebase
  pod 'Firebase/Crashlytics'
  pod 'Firebase/Analytics'
end

def sharedPods
  pod 'SwiftLint'
  pod 'Fakery', :git => 'https://github.com/vadymmarkov/Fakery', :branch => 'master'
  swiftyJSON
  rxSharedPods
end

def rxSharedPods
  pod 'RxSwift', '~> 5'
  pod 'RxSwiftExt', '~> 5'
end

def rxTestingPods
  pod 'RxTest'
  pod 'RxBlocking'
end

def presentationPods
  pod 'SwiftGen', '~> 6.0'
  pod 'SwiftMessages'
  pod 'SwiftRichString'
  pod 'NVActivityIndicatorView/Extended'
  pod 'Kingfisher', '~> 5.0'
  rxPresentationPods
end

def rxPresentationPods
  pod 'RxCocoa', '~> 5'
  pod "RxSwiftUtilities"
  pod 'RxDataSources', :git => 'https://github.com/RxSwiftCommunity/RxDataSources', :branch => 'master'
end

def diPods
  pod 'Swinject', '~> 2.7.0'
  pod 'SwinjectAutoregistration', '~> 2.7.0'
end

def oxeNetworking
    pod 'OxeNetworking/RxOxeNetworking'
end

def swiftyJSON
  pod 'SwiftyJSON', '~> 5.0'
end

def networkingPods
  oxeNetworking
  pod 'AlamofireNetworkActivityLogger', '~> 3.0'
end

def storagePods
end

abstract_target 'TheFeelsTargets' do
  project 'TheFeels'
  sharedPods
  presentationPods
  diPods
  networkingPods
  storagePods
  firebase
  target 'TheFeels' do
    target 'TheFeelsTests' do
	   inherit! :search_paths
     rxTestingPods
    end
  end
end

target 'DI' do
  project 'DI/DI'
  sharedPods
  presentationPods
  diPods
  networkingPods
  storagePods
  target 'DITests' do
    rxTestingPods
  end
end

target 'AppNavigation' do
  project 'AppNavigation/AppNavigation'
  use_frameworks!
  sharedPods
  presentationPods
  diPods
  networkingPods
  storagePods
  target 'AppNavigationTests' do
    rxTestingPods
  end
end

target 'Common' do
  project 'Presentation/Common/Common'
  sharedPods
  presentationPods
  diPods
  target 'CommonTests' do
    rxTestingPods
  end
end

target 'User' do
  project 'Presentation/User/User'
  sharedPods
  presentationPods
  diPods
  target 'UserTests' do
    rxTestingPods
  end
end

target 'Domain' do
  project 'Domain/Domain'
  sharedPods
  target 'DomainTests' do
    rxTestingPods
  end
end

target 'AppData' do
  project 'Data/AppData/AppData'
  use_frameworks!
  sharedPods
  target 'AppDataTests' do
    rxTestingPods
  end
end

target 'Networking' do
  project 'Data/Networking/Networking'
  sharedPods
  networkingPods
  target 'NetworkingTests' do
    rxTestingPods
  end
end

target 'Storage' do
  project 'Data/Storage/Storage'
  sharedPods
  storagePods
  target 'StorageTests' do
    rxTestingPods
  end
end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end
