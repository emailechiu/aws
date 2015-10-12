# spark access
git clone https://github.com/emailechiu/aws
yum install -y python-pip
pip install --upgrade awscli
# aws configure # bypassed by loading profiles?
/root/ephemeral-hdfs/bin/hadoop dfs -chmod a+w /tmp/hive #so that sqlContext can be initialized
cd aws
aws s3 cp s3://echiutestss3/core-site.xml /root/spark/conf/ #spark s3 access
aws s3 cp --recursive s3://echiutestss3/.aws /root/.aws # aws ec2 commands in lieu of aws configure, or the line below
curl -s http://169.254.169.254/latest/meta-data/public-hostname >> /root/spark/conf/slaves

# After stopping spark, it loses the IP and needs to be refreshed
aws ec2 describe-instances --region us-east-1 --output text |grep INSTANCE|fgrep m3.xlarge| cut -f 14|grep amazonaws >/root/spark/conf/slaves
/root/spark/sbin/stop-all.sh
/root/spark/sbin/start-all.sh
/root/spark/bin/spark-shell -i tests3.scala

# processing
./bulkcsv_s3.sh

# wrapping up
aws s3 cp /root/spark/conf/core-site.xml s3://echiutestss3
git add *.scala
git add *.sh
git commit -a -m "generic"
git push origin master

