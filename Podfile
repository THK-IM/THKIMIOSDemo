# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'THKIMIOSDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for THKIMDemo

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
  
  pod 'THKIMSDK/IMCore', :git => 'git@github.com:THK-IM/THK-IM-IOS.git', :tag => '0.4.0'
  pod 'THKIMSDK/IMUI', :git => 'git@github.com:THK-IM/THK-IM-IOS.git', :tag => '0.4.0'
  pod 'THKIMSDK/IMPreviewer', :git => 'git@github.com:THK-IM/THK-IM-IOS.git', :tag => '0.4.0'
  pod 'THKIMSDK/IMProvider', :git => 'git@github.com:THK-IM/THK-IM-IOS.git', :tag => '0.4.0'
end
