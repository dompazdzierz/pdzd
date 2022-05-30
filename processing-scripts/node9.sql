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
