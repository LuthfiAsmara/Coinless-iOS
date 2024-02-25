# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

def general_pod
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Alamofire'
  pod 'ObjectMapper'
  pod 'Moya'
  
end

def ui_pod
  pod 'SnapKit'
end

target 'Coinless' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Coinless
  general_pod
  ui_pod

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      if dependencies.include? target.name
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
      xcconfig_path = config.base_configuration_reference.real_path
      xcconfig = File.read(xcconfig_path)
      xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
      File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
    end
  end
end


