for f in ./zipped/2015/8/*/*.zip 
 do 
   echo $f
   gzfile=`basename "$f" |cut -d. -f 1`.gz
   cwd=`dirname "$f"`
   unzip -p $f |gzip > $cwd/$gzfile
 done
# find ./zipped/2015/7 "*.zip" |xargs unzip -p |gzip 
# time /mnt/spark_1.5.0_bin/bin/spark-shell --packages com.databricks:spark-csv_2.10:1.1.0 -i bulkcsv.scala 


/opt/parallel/bin/parallel ls {}/*.zip \|wc \; ls {}/*.gz\|wc ::: 9
