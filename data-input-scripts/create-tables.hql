CREATE DATABASE data;
USE data;

CREATE TABLE IF NOT EXISTS Indicators (CountryName string, CountryCode string, IndicatorName string, IndicatorCode string, Year string, Value string);
CREATE TABLE IF NOT EXISTS IndicatorsTemp (CountryName string, CountryCode string, IndicatorName string, IndicatorCode string, Year string, Value string);

CREATE TABLE IF NOT EXISTS TradeData (t int, k string, i int, j int, v double, q double);
CREATE TABLE IF NOT EXISTS TradeDataTemp (t int, k string, i int, j int, v double, q double);

CREATE TABLE IF NOT EXISTS CountryCodes (Alpha3Code string, numeric string);
