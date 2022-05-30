CREATE DATABASE data;
USE data;

DROP TABLE IF EXISTS Indicators;
DROP TABLE IF EXISTS IndicatorsTemp;
DROP TABLE IF EXISTS TradeData;
DROP TABLE IF EXISTS TradeDataTemp;
DROP TABLE IF EXISTS CountryCodes;
DROP TABLE IF EXISTS Regions;
DROP TABLE IF EXISTS WTD_TMP1;
DROP TABLE IF EXISTS WTD_TMP2;
DROP TABLE IF EXISTS WTD_TMP3;
DROP TABLE IF EXISTS WTD_TMP4;
DROP TABLE IF EXISTS WTD_TMP5;
DROP TABLE IF EXISTS WDI_TMP1;
DROP TABLE IF EXISTS MIX_TMP1;
DROP TABLE IF EXISTS MIX_TMP2;
DROP TABLE IF EXISTS MIX_TMP3;
DROP TABLE IF EXISTS TARGET;

CREATE TABLE IF NOT EXISTS Indicators (CountryName string, CountryCode string, IndicatorName string, IndicatorCode string, Year string, Value string)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

CREATE TABLE IF NOT EXISTS IndicatorsTemp (CountryName string, CountryCode string, IndicatorName string, IndicatorCode string, Year string, Value string)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',';

CREATE TABLE IF NOT EXISTS TradeData (t int, k string, i int, j int, v double, q double)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

CREATE TABLE IF NOT EXISTS TradeDataTemp (t int, k string, i int, j int, v double, q double)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',';

CREATE TABLE IF NOT EXISTS CountryCodes (Alpha3Code string, NumericCode string)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

CREATE TABLE IF NOT EXISTS Regions (Alpha3Code string, Region string)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

CREATE TABLE IF NOT EXISTS WTD_TMP1 (Year string, HsCode string, HsGroup string, CountryImporter string, CountryExporter string, Value double, Volume double, PriceTon double);
CREATE TABLE IF NOT EXISTS WTD_TMP2 (Year string, HsCode string, AvgPriceTon double);
CREATE TABLE IF NOT EXISTS WTD_TMP3 (Year string, HsCode string, HsGroup string, CountryImporter string, CountryExporter string, Value double, Volume double, PriceTon double, TransactionProfitability int);
CREATE TABLE IF NOT EXISTS WTD_TMP4 (HsCode string, AvgPriceTonAllYears double);
CREATE TABLE IF NOT EXISTS WTD_TMP5 (HsCode string, ProductTier int);
CREATE TABLE IF NOT EXISTS WDI_TMP1 (Year string, CountryCode string, Region string, DevelopmentIndicator double);
CREATE TABLE IF NOT EXISTS MIX_TMP1 (Year string, HsCode string, HsGroup string, CountryImporter string, CountryExporter string, Value double, Volume double, PriceTon double, TransactionProfitability int, RegionExporter string, DevelopmentIndicator double);
CREATE TABLE IF NOT EXISTS MIX_TMP2 (Year string, CountryExporter string, RegionExporter string, ValueSum double, VolumeSum double);
CREATE TABLE IF NOT EXISTS MIX_TMP3 (Year string, HsCode string, HsGroup string, CountryImporter string, CountryExporter string, Value double, Volume double, PriceTon double, TransactionProfitability int, RegionExporter string, DevelopmentIndicator double, AreaExportValueTier int, AreaExportVolumeTier int);
CREATE TABLE IF NOT EXISTS TARGET (Year string, HsCode string, HsGroup string, CountryImporter string, CountryExporter string, Value double, Volume double, PriceTon double, TransactionProfitability int, RegionExporter string, DevelopmentIndicator double, AreaExportValueTier int, AreaExportVolumeTier int, ProductTier int);