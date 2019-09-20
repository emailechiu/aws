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
# sudo sed -i -e '$a\export PYSPARK_PYTHON=/usr/bin/python3' /etc/spark/conf/spark-env.sh
sudo aws s3 cp s3://vsat-lmtd/flint-assembly-0.6.0-SNAPSHOT.jar /opt/flint.jar
sudo pip-3.6 install matplotlib
sudo pip-3.6 install ts-flint
sudo pip-3.6 install pandas
sudo pip-3.6 install pyarrow
sudo pip-3.6 install boto3
sudo pip-3.6 install s3fs
sudo pip-3.6 install sagemaker
sudo pip-3.6 install sklearn
sudo pip-3.6 install elephas
sudo pip-3.6 install wrapt
sudo pip-3.6 install Image
sudo pip-3.6 install tensorflowonspark
sudo pip-3.6 install tensorframes
sudo pip-3.6 install sparkdl
sudo pip-3.6 install jieba
sudo pip-3.6 install kafka
sudo pip-3.6 install h2o
sudo pip-3.6 install IPython
sudo pip-3.6 install seaborn
sudo yum -y install tmux
sudo yum -y install htop
sudo yum -y install collectl
sudo yum -y install iotop

