Pod::Spec.new do |s| 
s.name = "ZYFCategory" 
s.version = "1.1.1"
s.summary = "方便Category" 
s.description = "方便Category 添加了头文件 方便引用" 
s.homepage = "https://github.com/Zyf210304/ZYFCategory"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Zyf210304" => "z672233580@163.com" } 
s.ios.deployment_target = '8.0' 
s.source = { :git => "https://github.com/Zyf210304/ZYFCategory.git", :tag => "#{s.version}" } 
s.source_files = "ZYFCategory/Code/*.{h,m}"
s.requires_arc = true 
s.frameworks = "Foundation","UIKit"
end