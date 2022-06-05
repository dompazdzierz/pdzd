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
    (CASE WHEN ValueRank < 0.05 THEN 1
        ELSE (CASE WHEN ValueRank < 0.15 THEN 2
            ELSE (CASE WHEN ValueRank < 0.30 THEN 3
            ELSE (CASE WHEN ValueRank < 0.55 THEN 4
            ELSE 5 END) END) END)
    END) AS AreaExportValueTier,
    (CASE WHEN VolumeRank < 0.05 THEN 1
        ELSE (CASE WHEN VolumeRank < 0.15 THEN 2
            ELSE (CASE WHEN VolumeRank < 0.30 THEN 3
            ELSE (CASE WHEN VolumeRank < 0.55 THEN 4
            ELSE 5 END) END) END)
    END)  AS AreaExportVolumeTier
FROM MIX_TMP1 mixt1
join (select 
	tmp21.Year, 
	tmp21.RegionExporter,
	RANK() OVER (partition by tmp21.RegionExporter ORDER BY tmp21.ValueSum DESC) / tmp22.NumInRegion as ValueRank,
	RANK() OVER (partition by tmp21.RegionExporter ORDER BY tmp21.VolumeSum DESC) / tmp22.NumInRegion as VolumeRank
	from MIX_TMP2 tmp21
	join (select Year, RegionExporter, COUNT(*) as NumInRegion from MIX_TMP2 group by RegionExporter, Year) tmp22 on (tmp21.RegionExporter = tmp22.RegionExporter and tmp21.Year = tmp22.Year)) tmp2All
    on (tmp2All.Year = mixt1.Year and tmp2All.RegionExporter = mixt1.RegionExporter);