CREATE DATABASE data;
USE data;

DROP TABLE IF EXISTS Indicators;
DROP TABLE IF EXISTS IndicatorsTemp;
DROP TABLE IF EXISTS TradeData;
DROP TABLE IF EXISTS TradeDataTemp;
DROP TABLE IF EXISTS CountryCodes;
DROP TABLE IF EXISTS Regions;

CREATE TABLE IF NOT EXISTS Indicators (CountryName string, CountryCode string, IndicatorName string, IndicatorCode string, Year string, Value string)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',';

CREATE TABLE IF NOT EXISTS IndicatorsTemp (CountryName string, CountryCode string, IndicatorName string, IndicatorCode string, Year string, Value string)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',';

CREATE TABLE IF NOT EXISTS TradeData (t int, k string, i int, j int, v double, q double)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',';

CREATE TABLE IF NOT EXISTS TradeDataTemp (t int, k string, i int, j int, v double, q double)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ';';

CREATE TABLE IF NOT EXISTS CountryCodes (Alpha3Code string, NumericCode string)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',';

CREATE TABLE IF NOT EXISTS Regions (Alpha3Code string, Region string)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',';
