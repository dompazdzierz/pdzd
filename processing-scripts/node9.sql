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
    (CASE WHEN tt.row_rank_value2 < ((select count(*) from MIX_TMP1 WHERE tt.RegionExporter = RegionExporter) * 0.05)
        THEN 1
        ELSE (CASE WHEN tt.row_rank_value2 < ((select count(*) from MIX_TMP1 WHERE tt.RegionExporter = RegionExporter) * 0.15)
            THEN 2
            ELSE 3
        END)
    END) AS AreaExportValueTier,
    (CASE WHEN tt.row_rank_volume2 < ((select count(*) from MIX_TMP1 WHERE tt.RegionExporter = RegionExporter) * 0.05)
        THEN 1
        ELSE (CASE WHEN tt.row_rank_volume2 < ((select count(*) from MIX_TMP1 WHERE tt.RegionExporter = RegionExporter) * 0.15)
            THEN 2
            ELSE 3
        END)
    END) AS AreaExportVolumeTier
FROM (
    SELECT
        CountryExporter,
        RegionExporter,
        Year,
        RANK() OVER (ORDER BY ValueSum) AS row_rank_value2,
        RANK() OVER (ORDER BY VolumeSum) as row_rank_volume2
    FROM MIX_TMP2
    GROUP BY RegionExporter
) as tt
JOIN MIX_TMP1 mixt1 ON tt.CountryExporter = mixt1.CountryExporter AND tt.Year = mixt1.Year;
