myfun() {
	f=$1
        gzfile=`basename "$f" |cut -d. -f 1`.gz
        cwd=`dirname "$f"`
        unzip -p $f |gzip > $cwd/$gzfile
}
export -f myfun

for dir in 6 5 4 3 2 1
do 
echo $dir
{ time find ~ec2-user/zipped/2015/$dir -name "*.zip" |/opt/parallel/bin/parallel myfun ;} >>/home/ec2-user/zipped/2015/$dir/UnzipGzip.log
done

# /opt/parallel/bin/parallel ls {}/*/*.zip \|wc \; ls {}/*/*.gz\|wc ::: 7 8
