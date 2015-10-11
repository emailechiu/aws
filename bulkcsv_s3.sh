#[ -e result ] && rm -R result
{ time /root/spark/bin/spark-shell --packages com.databricks:spark-csv_2.10:1.1.0 -i /root/aws/bulkcsv_s3.scala ;} 2>>/root/aws/logfile

