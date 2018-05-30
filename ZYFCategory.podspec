Pod::Spec.new do |s| 
s.name = "ZYFCategory" 
s.version = "1.0.0"
s.summary = "方便Category" 
s.description = "方便Category 希望大家喜欢" 
s.homepage = "https://github.com/Zyf210304/ZYFCategory"
s.license = "MIT"
s.author = { "Zyf210304" => "z672233580@163.com" } 
s.ios.deployment_target = '9.0' 
s.source = { :git => "https://github.com/Zyf210304/ZYFCategory.git", :tag => "#{s.version}" } 
s.source_files = "ZYFCategory/*.{h,m}"
s.requires_arc = true 
s.framework = "UIKit" 
end