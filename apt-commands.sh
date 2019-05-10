# repositories can be found under
cd /etc/apt
cat sources.list

# update list of packages and then upgrade to newer versions
apt update
apt upgrade

# to upgrade and remove/add new packages for our current setup
apt full-upgrade

# to search for a specific package
apt-cache search <name>

# install package
apt install <name>

# verify installation
which <name>

# remove package
apt remove <name>

# remove configuration files with the package (works even if the package has already been removed)
apt remove --purge <name>

# automatically remove unused configurations
apt autoremove