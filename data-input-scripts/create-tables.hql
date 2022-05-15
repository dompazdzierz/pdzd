CREATE DATABASE data;
USE data;

CREATE TABLE IF NOT EXISTS Indicators (CountryName string, CountryCode string, IndicatorName string, IndicatorCode string, Year string, Value string)
TBLPROPERTIES ('transactional' = 'true');

CREATE TABLE IF NOT EXISTS IndicatorsTemp (CountryName string, CountryCode string, IndicatorName string, IndicatorCode string, Year string, Value string)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
TBLPROPERTIES ('transactional' = 'true');

CREATE TABLE IF NOT EXISTS TradeData (t int, k string, i int, j int, v double, q double)
TBLPROPERTIES ('transactional' = 'true');

CREATE TABLE IF NOT EXISTS TradeDataTemp (t int, k string, i int, j int, v double, q double)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ';'
TBLPROPERTIES ('transactional' = 'true');

CREATE TABLE IF NOT EXISTS CountryCodes (Alpha3Code string, NumericCode string)
TBLPROPERTIES ('transactional' = 'true');

CREATE TABLE IF NOT EXISTS Regions (Alpha3Code string, Region string)
TBLPROPERTIES ('transactional' = 'true');
