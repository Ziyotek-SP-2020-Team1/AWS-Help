#!/bin/bash
# Name: AWS CLI & cfn-lint & cfn-nag installer script
# Creator: Sardorbek Usmonov
# Version: 1.0.0

# Installs AWS CLI & enables aws completer to make it able to use
cd /root/
yum install wget unzip epel-release -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
export PATH=/usr/local/bin/aws:$PATH
source ~/.bash_profile
echo -e "\n#Runs aws_completer when system is started \ncomplete -C '/usr/local/bin/aws_completer' aws" >> ~/.bash_profile
source ~/.bash_profile

# Installs cfn-lint and for that installs pyhton version 3
yum update -y
yum install python3 -y
pip3 install cfn-lint

# Installs cfn-nag and for that it installs ruby version 2.6.6
yum install ruby -y
yum install git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel -y
curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -
export PATH=/.rbenv/bin:$PATH
source ~/.bash_profile
echo -e '\nexport PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
rbenv install 2.6.6
rbenv global 2.6.6
gem install cfn-nag