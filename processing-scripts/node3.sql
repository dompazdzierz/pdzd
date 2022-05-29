INSERT INTO WTD_TMP3 (
    SELECT
        Year, 
        HsCode,
        HsGroup,
        CountryImporter,
        CountryExporter,
        Value,
        Volume,
        PriceTon,
        (IF (Value / Volume) < (AvgPriceTon * 0.9) THEN 0
        ELSE IF (Value / Volume) <= (AvgPriceTon * 1.1) THEN 1 
        ELSE 2) AS TransactionProfitability
    FROM 
        WTD_TMP1 tmp1 JOIN WTD_TMP2 tmp2 
            ON tmp1.Year = tmp2.Year AND tmp1.HsCode = tmp2.HsCode
);
