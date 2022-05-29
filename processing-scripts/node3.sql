INSERT OVERWRITE TABLE WTD_TMP3 
    SELECT
        tmp1.Year, 
        tmp1.HsCode,
        tmp1.HsGroup,
        tmp1.CountryImporter,
        tmp1.CountryExporter,
        tmp1.Value,
        tmp1.Volume,
        tmp1.PriceTon,
        (case when (tmp1.Value / tmp1.Volume) < (tmp2.AvgPriceTon * 0.9) THEN 0
        ELSE (case when (tmp1.Value / tmp1.Volume) <= (tmp2.AvgPriceTon * 1.1) THEN 1 else 2 end)
        end) AS TransactionProfitability
    FROM 
        WTD_TMP1 tmp1 JOIN WTD_TMP2 tmp2 
            ON tmp1.Year = tmp2.Year AND tmp1.HsCode = tmp2.HsCode;
