USE data;
LOAD DATA INPATH '/tmp/hadoop/trade-data.csv' OVERWRITE INTO TABLE TradeDataTemp;

DELETE FROM TradeData WHERE t IN (SELECT DISTINCT t from TradeDataTemp);
INSERT INTO TradeData SELECT * FROM TradeDataTemp;

