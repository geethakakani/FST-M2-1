-- Load the CSV file into pig
salesInput = LOAD 'hdfs:///user/geethakakani5/slaes.csv' USING PigStorage(',') AS (Product:chararray,Price:chararray,Payment_Type:chararray,Name:chararray,City:chararray,State:chararray,Country:chararray);
-- Group data by Country
grpd = GROUP salesInput BY Country;
-- count the umber of rows
totalcount = FOREACH grpd GENERATE CONCAT((chararray)$0, CONCAT(':', (chararray)COUNT($1)));
-- Store the output in the HDFS
STORE totalcount INTO 'hdfs:///user/geethakakani5/PigOutput2';
