# spark access
git clone https://github.com/emailechiu/aws
yum install python-pip
pip install --upgrade awscli
aws configure
cd aws
aws s3 cp s3://echiutestss3/core-site.xml /root/spark/conf/
curl -s http://169.254.169.254/latest/meta-data/public-hostname >> /root/spark/conf/slaves
/root/spark/sbin/stop-all.sh
/root/spark/sbin/start-all.sh

# processing
./bulkcsv_s3.sh

# wrapping up
aws s3 cp /root/spark/conf/core-site.xml s3://echiutestss3
aws s3 cp /root/spark/conf/spark-defaults.xml s3://echiutestss3 
git add *.scala
git add *.sh
git commit -a -m "generic"
git push origin master

