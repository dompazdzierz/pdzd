INSERT INTO WTD_TMP4 (
    SELECT
    HsCode, 
    AVG(AvgPriceTon) AS AvgPriceTonAllYears
    FROM WTD_TMP2
    GROUP BY HsCode
)
