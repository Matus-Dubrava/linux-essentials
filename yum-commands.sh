# search for package
yum search httpd

# get info about package
yum info httpd

# install it
yum install httpd

# verify installation
yum list installed httpd

# check dependencies that the package needs
yum deplist httpd

# remove the package
yum remove httpd

# remove the package with its dependecies that are not needed anymore by other components
yum autoremove httpd

# find the installed application
which httpd

# see list of repositories that our system connects to
yum repolist

# list of repositories that are configured for our system can be found under folder
cd /etc/yum.repose.d/

# to clean our packages
yum clean all

# update packages 
yum update
