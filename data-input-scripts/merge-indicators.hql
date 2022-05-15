USE data;
LOAD DATA INPATH '/tmp/hadoop/indicators.csv' OVERWRITE INTO TABLE IndicatorsTemp;

MERGE INTO Indicators AS T
USING IndicatorsTemp AS S
ON  T.CountryCode == S.CountryCode 
    AND T.IndicatorCode == S.IndicatorCode   
    AND T.Year == S.Year
WHEN MATCHED THEN UPDATE SET T.Value = S.Value
WHEN NOT MATCHED THEN INSERT VALUES (S.CountryName, S.CountryCode, S.IndicatorName, S.IndicatorCode, S.Year, S.Value);


