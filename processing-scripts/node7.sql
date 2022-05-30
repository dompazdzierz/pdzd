INSERT OVERWRITE
TABLE MIX_TMP1
SELECT
    wdi1.Year as Year,
    HsCode,
    HsGroup,
    CountryImporter,
    CountryExporter,
    Value,
    Volume,
    PriceTon,
    TransactionProfitability,
    wdi1.Region as RegionExporter,
    wdi1.DevelopmentIndicator as DevelopmentIndicator
FROM WDI_TMP1 wdi1
    JOIN WTD_TMP3 wtdt3 on (wdi1.Year = wtdt3.Year and wdi1.CountryCode = wtdt3.CountryExporter)