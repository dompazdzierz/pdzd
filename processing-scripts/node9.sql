INSERT OVERWRITE
TABLE MIX_TMP3
SELECT
    mixt1.Year AS Year,
    HsCode,
    HsGroup,
    CountryImporter,
    mixt1.CountryExporter AS CountryExporter,
    Value,
    Volume,
    PriceTon,
    TransactionProfitability,
    mixt1.RegionExporter AS RegionExporter,
    DevelopmentIndicator,
    (CASE WHEN (Value / (Select MAX(Value) from MIX_TMP1 WHERE mixt1.RegionExporter = RegionExporter) > 0.95)
        THEN 1
        ELSE (CASE WHEN (Value / (Select MAX(Value) from MIX_TMP1 WHERE mixt1.RegionExporter = RegionExporter) > 0.80)
            THEN 2
            ELSE 3
        END)
    END) AS AreaExportValueTier,
    (CASE WHEN (Volume / (Select MAX(Volume) from MIX_TMP1 WHERE mixt1.RegionExporter = RegionExporter) > 0.95)
        THEN 1
        ELSE (CASE WHEN (Volume / (Select MAX(Volume) from MIX_TMP1 WHERE mixt1.RegionExporter = RegionExporter) > 0.80)
            THEN 2
            ELSE 3
        END)
    END) AS AreaExportVolumeTier
FROM MIX_TMP1 mixt1;

//TODO -> some test sqls below

select 
	tmp21.Year, 
	tmp21.RegionExporter, 
	RANK() OVER (ORDER BY tmp21.ValueSum DESC)
	from MIX_TMP2 tmp21 join (select AVG(ValueSum) as RegionAvgVal, AVG(VolumeSum) as RegionAvgVol from MIX_TMP2
group by Year, RegionExporter) tmp2 on (tmp21.RegionExporter = tmp2.RegionExporter and tmp21.Year = tmp2.Year)
where tmp21.RegionExporter = 'East Asia & Pacific';

select * from MIX_TMP2 tmp1 join (select Year, RegionExporter, AVG(ValueSum) as RegionAvgVal, AVG(VolumeSum) as RegionAvgVol from MIX_TMP2
group by Year, RegionExporter) tmp2 on (tmp1.RegionExporter = tmp2.RegionExporter and tmp1.Year = tmp2.Year);