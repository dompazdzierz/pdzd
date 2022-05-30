INSERT OVERWRITE TABLE WDI_TMP1 (
select 
	id.Year,
	id.CountryCode,
	cc.Region,
	id.Value / (select max(Value) from Indicators where Year = id.Year and indicatorname = 'GDP per capita (current US$)')
	from 
Indicators as id
JOIN Regions AS cc ON id.CountryCode = cc.Alpha3Code  
where id.indicatorname = 'GDP per capita (current US$)'
);