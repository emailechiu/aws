sudo yum -y install gcc-c++.noarch
sudo yum -y install curl.x86_64 libcurl-devel.x86_64 libcurl.x86_64
sudo yum -y install libxml2.x86_64 libxml2-devel.x86_64
sudo yum -y install openssl-devel.x86_64
sudo yum -y install git
wget http://ftp.gnu.org/gnu/parallel/parallel-20150922.tar.bz2
tar xfj parallel-20150922.tar.bz2
cd parallel-20150922
./configure -prefix=/opt/parallel
make && make install
cd ~ec2-user

wget http://s3fs.googlecode.com/files/s3fs-1.74.tar.gz
tar -zxf s3fs-1.74.tar.gz
cd s3fs-1.74
./configure -prefix=/opt/s3fs
make && sudo make install
cd ~ec2-user

echo "AKIAJA2O6XN4CHG463TQ:nsTwkroBv8SJffD54JCA3XPRRUCOfXwR83+gPpa+" > ~ec2-user/.passwd-s3fs
chmod 600 ~ec2-user/.passwd-s3fs
sudo cp ~ec2-user/.passwd-s3fs /etc/passwd-s3fs
sudo chmod 640 /etc/passwd-s3fs
mkdir ~ec2-user/zipped
chmod 600 /root/.passwd-s3fs
sudo /opt/s3fs/bin/s3fs lmtd ~ec2-user/zipped -odefault_acl=public-read-write -oallow_other

aws s3 cp s3://echiutestss3/bulkcsv.sh ~ec2-user/ 
#for f in * ; do echo $f; ls $f/*.zip|wc; ls $f/*.gz|wc ; done
#more /proc/cpuinfo
#more /proc/meminfo
aws s3 cp ~ec2-user/bulkcsv.sh s3://echiutestss3
aws s3 cp ~ec2-user/bootstrap.sh s3://echiutestss3
aws s3 cp ~ec2-user/parallel_unzip.sh s3://echiutestss3

