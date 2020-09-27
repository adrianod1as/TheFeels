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
  pod 'SwiftDate'
end

def presentationPods
end

def diPods
  oxeNetworking
  pod 'Swinject', '~> 2.7.0'
  pod 'SwinjectAutoregistration', '~> 2.7.0'
end

def oxeNetworking
    pod 'OxeNetworking'
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
    end
  end
end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end
