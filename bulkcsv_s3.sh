[ -e result ] && rm -R result
time /root/spark/bin/spark-shell --packages com.databricks:spark-csv_2.10:1.1.0 -i part1.scala

