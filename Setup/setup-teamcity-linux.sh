# Install teamcity
sudo yum install java-1.8.0-openjdk
wget https://download.jetbrains.com/teamcity/TeamCity-2017.2.1.tar.gz
tar -xvf TeamCity-2017.2.1.tar.gz

# Start TeamCity
cd TeamCity/
bin/runAll.sh start

# Setup TeamCity
echo "You will need to setup teamcity through the webapp (default port is 8111)"
