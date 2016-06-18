 
Pod::Spec.new do |s|
 

  s.name         = "MonkeyBaseWork"
  s.version      = "1.1"
  s.summary      = "MonkeyBaseWork Sample Task....."
 

  s.homepage     = "https://github.com/junhaiyang/MonkeyBaseWork"
 
  s.license      = "MIT"
 
  s.author             = { "yangjunhai" => "junhaiyang@gmail.com" } 
  s.ios.deployment_target = "7.0" 

  s.ios.framework = 'UIKit'
 
  s.source = { :git => 'https://github.com/junhaiyang/MonkeyBaseWork.git' , :tag => '1.1'} 
 
  s.requires_arc = true

  s.source_files = '*.{h,m,mm}'  
 
  s.subspec 'CommonObject' do |ds|
    
    ds.source_files = 'CommonObject/*.{h,m,mm}' 
          
  end
  s.subspec 'AppObject' do |ds|
    
    ds.source_files = 'AppObject/*.{h,m,mm}' 
          
  end
  s.subspec 'SBTabBarViewController' do |ds|
    
    ds.source_files = 'SBTabBarViewController/*.{h,m,mm}' 
          
  end
  s.subspec 'ViewController' do |ds|
    
    ds.source_files = 'ViewController/*.{h,m,mm}' 

    ds.subspec 'KKNavigationController' do |ks|
    
      ks.source_files = 'ViewController/KKNavigationController/*.{h,m,mm}' 
          
    end
          
  end
 

  s.dependency 'RDVTabBarController', '1.1.9'
  s.dependency 'MJRefresh', '3.1.1' 
  s.dependency 'Masonry', '1.0.1'
  s.dependency 'DZNEmptyDataSet', '1.8.1'
  s.dependency 'DSAlertView-Blocks', '1.1.2'
  s.dependency 'MBProgressHUD', '0.9.2'
   
 
end
