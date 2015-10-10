val csvfile = "s3n://lmtd/2015/8/*/*.gz"

val terms_pre=sqlContext.load("com.databricks.spark.csv",Map("path"->csvfile,"header"->"true"))
val terms  = terms_pre.selectExpr("Device_ID","Mood","Collection_End_Time","Reboot_Count", "WAC_Crash_Count","HTTP_Response_Time_80_Percentile","HTTP_Response_Time_90_Percentile","HTTP_Response_Time_Mean","HTTP_Response_Time_Median","Last_Associated_IPGW_ID","cast(Beam_ID as int) as Beam_ID")
terms.registerTempTable("terms")
val df= sqlContext.sql(qrystr)
time(df.repartition(1).write.format("com.databricks.spark.csv").option("header", "true").save(outputdir))
System.exit(0)