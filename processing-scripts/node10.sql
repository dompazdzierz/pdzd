INSERT OVERWRITE
TABLE TARGET
SELECT
    Year,
    mix.HsCode AS HsCode,
    HsGroup,
    CountryImporter,
    CountryExporter,
    Value,
    Volume,
    PriceTon,
    TransactionProfitability,
    RegionExporter,
    DevelopmentIndicator,
    AreaExportValueTier,
    AreaExportVolumeTier,
    ProductTier
FROM MIX_TMP3 mix JOIN WTD_TMP5 wtd ON mix.HsCode = wtd.HsCode