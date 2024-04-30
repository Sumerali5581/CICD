# #!/usr/bin/env bash
# cd /home/ec2-user/server
# sudo java -jar -Dserver.port=80 \
#     *.jar > /dev/null 2> /dev/null < /dev/null &

# sudo yum update -y

# # Install Java Development Kit (JDK)
# sudo yum install java-1.8.0-openjdk-devel -y

# # Download and extract Tomcat
# wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.52/bin/apache-tomcat-9.0.52.tar.gz
# tar -xzf apache-tomcat-9.0.52.tar.gz

# # Start Tomcat
# apache-tomcat-9.0.52/bin/startup.sh

# # Copy your .jar file to Tomcat's webapps directory
# cp /path/to/your/application.jar apache-tomcat-9.0.52/webapps/

#!/usr/bin/env bash

sudo su
# Update package repositories
sudo yum update -y

# Install Java Development Kit (JDK)
sudo yum install java-17 -y

# Download and extract Tomcat
cd /opt
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.86/bin/apache-tomcat-9.0.86.tar.gz
sudo tar -zvxf apache-tomcat-9.0.86.tar.gz

# Change directory to the extracted Tomcat directory
cd apache-tomcat-9.0.86/

# Start Tomcat
sudo ./bin/startup.sh

# Copy your .jar file to Tomcat's webapps directory
sudo cp /home/ubuntu/server/*.war webapps/

