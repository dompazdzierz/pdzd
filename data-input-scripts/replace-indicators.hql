USE data;
LOAD DATA INPATH '/tmp/hadoop/indicators.csv' OVERWRITE INTO TABLE IndicatorsTemp;

DELETE FROM Indicators WHERE Year IN (SELECT DISTINCT Year from IndicatorsTemp);
INSERT INTO Indicators SELECT * FROM IndicatorsTemp;


