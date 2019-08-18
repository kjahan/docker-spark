from pyspark import SparkContext

sc = SparkContext(appName="TweetsInsights")
text_file = sc.textFile("election.2016-06-06-00_57_12.txt")

counts = text_file.flatMap(lambda line: line.split(" ")) \
             .map(lambda word: (word, 1)) \
             .reduceByKey(lambda a, b: a + b)
counts.saveAsTextFile("counters.txt")