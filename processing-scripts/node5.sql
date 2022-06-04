INSERT OVERWRITE TABLE WTD_TMP5 
    SELECT 
        tt.row_hs_code,
        (CASE WHEN tt.row_rank2 < ((select count(*) from WTD_TMP4) * 0.05) THEN 1
            ELSE (CASE WHEN tt.row_rank2 < ((select count(*) from WTD_TMP4) * 0.15) THEN 2 
                ELSE (CASE WHEN tt.row_rank2 < ((select count(*) from WTD_TMP4) * 0.30) THEN 3 
                    ELSE (CASE WHEN tt.row_rank2 < ((select count(*) from WTD_TMP4) * 0.55) THEN 4 
                        ELSE 5 END) END) END)
        END)
    FROM (
        SELECT 
           HsCode as row_hs_code,
            RANK() OVER (ORDER BY AvgPriceTonAllYears DESC) as row_rank2
        FROM WTD_TMP4
        ) as tt;
