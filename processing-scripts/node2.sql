INSERT OVERWRITE TABLE WTD_TMP2 
    SELECT
        Year, 
        HsCode,
        AVG(PriceTon) as AvgPriceTon
    FROM WTD_TMP1
    GROUP BY Year, HsCode;