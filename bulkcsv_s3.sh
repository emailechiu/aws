export HADOOP_CONFIG_DIR=file://
export AWS_ACCESS_KEY_ID=AKIAJA2O6XN4CHG463TQ 
export AWS_SECRET_ACCESS_KEY=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
[ -e result ] && rm -R result
time /root/spark/bin/spark-shell --packages com.databricks:spark-csv_2.10:1.1.0 -i part1.scala

