import java.io.File
import java.net.URL
import scala.sys.process._
import org.apache.spark.SparkContext
import sqlContext.implicits._
import org.apache.spark.sql._
import org.apache.spark.sql.types._
import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.log4j.Logger
import org.apache.log4j.Level
Logger.getLogger("org").setLevel(Level.ERROR)
Logger.getLogger("akka").setLevel(Level.ERROR)
def time[A](f: => A) = {
  val s = System.nanoTime
  val ret = f
  println("time: "+"%.1f".format((System.nanoTime-s)/1e9)+"s")
  ret
}
val sanfile="/root/happyunhappy_atlarge.csv"
val outputdir ="/root/result"
val qrystr= "select * from terms join san using Device_ID"
val san_pre=sqlContext.load("com.databricks.spark.csv",Map("path"->sanfile,"header"->"true"))
val san = san_pre.selectExpr("DeviceId","Mood")
san.registerTempTable("san")
val csvfile = "s3://lmtd/2015/8/*/*.gz"

val terms_pre=sqlContext.load("com.databricks.spark.csv",Map("path"->csvfile,"header"->"true"))
val terms  = terms_pre.selectExpr("Device_ID","Mood","Collection_End_Time","Reboot_Count", "WAC_Crash_Count","HTTP_Response_Time_80_Percentile","HTTP_Response_Time_90_Percentile","HTTP_Response_Time_Mean","HTTP_Response_Time_Median","Last_Associated_IPGW_ID","cast(Beam_ID as int) as Beam_ID")
terms.registerTempTable("terms")
val df= sqlContext.sql(qrystr)
time(df.repartition(1).write.format("com.databricks.spark.csv").option("header", "true").save(outputdir))
System.exit(0)
