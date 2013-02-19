name             "Customized_Wordpress"
maintainer       "Nick Willever"
maintainer_email "nickwillever@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures a Customized WordPress"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe "Customized_Wordpress::default", "Installs and configures WordPress with default attributes"

depends "wordpress" "= 1.0.0"

%w{ centos ubuntu }.each do |os|
  supports os
end
