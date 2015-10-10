# spark access
git clone https://github.com/emailechiu/aws
yum install python-pip
pip install --upgrade awscli
aws configure
cd aws
aws s3 cp s3://echiutestss3/bootstrap.sh .
aws s3 cp s3://echiutestss3/bootstrap_s3.sh .
aws s3 cp s3://echiutestss3/core-site.xml /root/spark/conf/
/root/spark/sbin/stop-all.sh
/root/spark/sbin/start-all.sh

