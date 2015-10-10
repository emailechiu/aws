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
val sanfile="s3n://echiutestss3/happyunhappy_atlarge.csv"
val outputdir ="s3n://lmtd/http_result"
val qrystr= "select * from terms join san using Device_ID"
val san_pre=sqlContext.load("com.databricks.spark.csv",Map("path"->sanfile,"header"->"true"))
val san = san_pre.selectExpr("Device_ID","Mood")
san.registerTempTable("san")
