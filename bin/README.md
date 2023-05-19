# Customer-Experience-Analytics
Customer Experience Analytics to give actionable insights to your call center team.

## Step to run on AWS:
### 1. Create EC2 Instance and install docker, git, jdk 17 and Jenkins

1.1. Install Docker
- sudo -i
- sudo yum update -y
- sudo yum install docker -y
- sudo service docker start
- docker -v

1.2. Install Git
- sudo yum install git -y
- git version


1.3. Install jdk17
- sudo yum update -y
- wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm
- sudo rpm -i jdk-17_linux-x64_bin.rpm
- java -version

1.4. Install Jenkins
- sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
- sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
- sudo yum upgrade
- sudo amazon-linux-extras install java-openjdk11 -y
- sudo yum install jenkins -y
- sudo systemctl enable jenkins
- sudo systemctl start jenkins

### 2. Config port access of EC2 instance
- Add Http, https and port 9000 to inbound rule of security group
#### Add permisson:
- sudo usermod -aG docker jenkins
- ls -l /var/run/docker.sock
- sudo chmod 666 /var/run/docker.sock

### 3. Run and config Jenkins and pipeline
- Script password: sudo cat /var/lib/jenkins/secrets/initialAdminPassword
- Generate git token and add to Jenkins
- Config jenkins

### 4. Run demo 
#### Tài khoản manager:
- Email: brenhernandez215@gmail.com
- Password: XHh9X139h2
#### Tài khoản agent:
- Email: nathan5@hotmail.com
- Password: 6LEYwPDOT7
