-- Load input files
episodeIV = LOAD 'hdfs:///user/geethakakani5/input/episodeIV_dialogues.txt' USING PigStorage('\t') AS (name:chararray, line:chararray);
episodeV = LOAD 'hdfs:///user/geethakakani5/input/episodeV_dialogues.txt' USING PigStorage('\t') AS (name:chararray, line:chararray);
episodeVI = LOAD 'hdfs:///user/geethakakani5/input/episodeVI_dialogues.txt' USING PigStorage('\t') AS (name:chararray, line:chararray);

--combine Episodes
combined_episodes = UNION episodeIV, episodeV, episodeVI;

--groupby name
grouped_by_name = GROUP combined_episodes BY name;
--STORE grouped_by_name INTO 'hdfs:///user/geethakakani5/PigProjresults';

-- Count the number of lines by each character
line_count = FOREACH grouped_by_name GENERATE $0 AS name, COUNT($1) AS num_lines;

Ordernames = ORDER line_count BY num_lines DESC;

rmf hdfs:///user/geethakakani5/PigProjresults

-- Store the result in HDFS
STORE Ordernames INTO 'hdfs:///user/geethakakani5/PigProjresults';

