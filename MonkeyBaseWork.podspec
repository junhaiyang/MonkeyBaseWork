 
Pod::Spec.new do |s|
 

  s.name         = "MonkeyBaseWork"
  s.version      = "1.1.2"
  s.summary      = "MonkeyBaseWork Sample Task....."
 

  s.homepage     = "https://github.com/junhaiyang/MonkeyBaseWork"
 
  s.license      = "MIT"
 
  s.author             = { "yangjunhai" => "junhaiyang@gmail.com" } 
  s.ios.deployment_target = "7.0" 

  s.ios.framework = 'UIKit'
 
  s.source = { :git => 'https://github.com/junhaiyang/MonkeyBaseWork.git' , :tag => '1.1.2'} 
 
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
 

  s.dependency 'RDVTabBarController'
  s.dependency 'MJRefresh'
  s.dependency 'Masonry'
  s.dependency 'DZNEmptyDataSet'
  s.dependency 'DSAlertView-Blocks'
  s.dependency 'MBProgressHUD'
   
 
end
