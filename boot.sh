#/bin/bash
set -ex
# virtualenv --system-site-packages vsat-lmtd  -p /usr/bin/python3
# source vsat-lmtd/bin/activate
#wget https://piccolo.link/sbt-1.2.8.tgz
#tar -xf sbt-1.2.8.tgz
#sudo mv sbt /opt
#export PATH=$PATH:/opt/sbt/bin

#sudo yum install -y git
#git clone  https://github.com/twosigma/flint.git
#cd flint
#make dist
#cd
#mv flint /opt
sudo aws s3 cp s3://qaessential/flint-assembly-0.6.0-SNAPSHOT.jar /opt
sudo pip-3.6 install ts-flint
sudo pip-3.6 install pandas
sudo pip-3.6 install pyarrow
