
# coding: utf-8

# In[6]:


get_ipython().system('hostname')
get_ipython().system('/home/ec2-user/anaconda3/envs/python3/bin/pyspark --version')


# In[ ]:


spark


# In[ ]:


import os
#.environ['PYSPARK_SUBMIT_ARGS'] = '--packages org.apache.spark:spark-avro_2.11:2.4.0 pyspark-shell'
packages = "org.apache.spark:spark-avro_2.11:2.4.0"
os.environ["PYSPARK_SUBMIT_ARGS"] = ("--packages {0} pyspark-shell".format(packages))
from pyspark.sql import SparkSession
spark=SparkSession.builder.getOrCreate()
spark.sparkContext.getConf().getAll()
spark.sparkContext.version
#dF = spark.read.format("avro").load("/home/ec2-user/0.avro").show()


# In[ ]:


# Must instantiate with hive and hadoop tool on EMR if need to use spark
# Must use sagemaker classpath_jars to get access to S3
# Must use s3a: instead of s3 to use roles instead of supplying secreat key 
# Must turn on DNS to avoid pyspark jar error
import sagemaker_pyspark
from pyspark.sql import SparkSession
#from sagemaker_pyspark import classpath_jars # for S3 access
#spark=SparkSession.builder.config('spark.jars.packages','org.apache.spark:spark-avro_2.11:2.4.0').config("spark.driver.extraClassPath", ":".join(classpath_jars())).getOrCreate()
#spark=SparkSession.builder.config("spark.driver.extraClassPath", ":".join(classpath_jars())).getOrCreate()
spark=SparkSession.builder.config('spark.jars.packages','org.apache.spark:spark-avro_2.11:2.4.0').getOrCreate()
#spark.conf.set('spark.jars.packages','org.apache.spark:spark-avro_2.11:2.4.0')
#spark.sparkContext.getConf().getAll()
spark.version
#dF = spark.read.format("avro").load("/home/ec2-user/0.avro").show()
#dF = spark.read.format("avro").load("s3a://sfdmdb/SF_CASE_VW/ymd=20181101/0.avro").show()


# In[ ]:


from pyspark.sql import SparkSession
from sagemaker_pyspark import classpath_jars # for S3 access
spark=SparkSession.builder.config("spark.driver.extraClassPath", ":".join(classpath_jars())).config('spark.jars.packages','org.apache.spark:spark-avro_2.11:2.4.0').getOrCreate()
# spark.conf.set('spark.jars.packages','org.apache.spark:spark-avro_2.11:2.4.0')
#dF = spark.read.format("avro").load("/home/ec2-user/0.avro").show()
dF = spark.read.format("avro").load("s3a://sfdmdb/SF_CASE_VW/ymd=20181101/0.avro").show()


# In[ ]:


get_ipython().system('wget https://raw.githubusercontent.com/jupyter-incubator/sparkmagic/master/sparkmagic/example_config.json')
get_ipython().system('sed s/localhost/10.0.0.244/g example_config.json > /home/ec2-user/.sparkmagic/config.json')
get_ipython().system('sed -i s/10.0.0.155/10.0.0.244/g /home/ec2-user/.sparkmagic/config.json')


# In[ ]:


get_ipython().run_line_magic('lsmagic', '')
get_ipython().run_line_magic('load_ext', 'sparkmagic.magics')
get_ipython().run_line_magic('manage_spark', '')


# In[ ]:


get_ipython().run_line_magic('spark', 'add -s session_ingest -l python -u http://10.0.0.155:8998')


# In[ ]:


get_ipython().run_cell_magic('spark', '-s session_ingest', 'trainingData_info = spark.read.parquet("s3a://qaessential/jup2_stats.terminal_info/ymd=20181129").select(\'device_id\',\'absolute_beam_id\')\ntrainingData_info.show()')


# In[ ]:


get_ipython().system('conda install --yes --name JupyterSystemEnv --channel r r-essentials=1.7')


# In[ ]:


trainingData_info = spark.read.parquet("s3a://qaessential/jup2_stats.terminal_info/ymd=20181127").select('device_id','absolute_beam_id')
trainingData_info.show()


# In[ ]:


case = spark.read.format("avro").load("/home/ec2-user/0.avro").show()


# In[ ]:


from pyspark.sql import SparkSession
from sagemaker_pyspark import classpath_jars # for S3 access
spark=SparkSession.builder.config("spark.driver.extraClassPath", ":".join(classpath_jars())).config('spark.jars.packages','org.apache.spark:spark-avro_2.11:2.4.0').getOrCreate()
# spark.conf.set("spark.jars.packages","org.apache.spark:spark-avro_2.11:2.4.0")
#dF = spark.read.format("avro").load("/home/ec2-user/0.avro").show()
dF = spark.read.format("avro").load("s3a://sfdmdb/SF_CASE_VW/ymd=20181101/0.avro").show()


# In[ ]:


spark


# In[ ]:


get_ipython().run_line_magic('manage_spark', '')


# In[ ]:


spark.stop()
spark=SparkSession.builder.config('spark.jars.packages','org.apache.spark:spark-avro_2.11:2.4.0').config("spark.driver.extraClassPath", ":".join(classpath_jars())).getOrCreate()
dF = spark.read.format("avro").load("/home/ec2-user/0.avro").show()


# In[ ]:


spark


# In[ ]:


spark=SparkSession.builder.config('spark.jars.packages','org.apache.spark:spark-avro_2.11:2.4.0').config("spark.driver.extraClassPath", ":".join(classpath_jars())).getOrCreate()
spark

