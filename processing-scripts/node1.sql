INSERT INTO WTD_TMP1 (
    SELECT 
        wd.t AS Year, 
        wd.k AS HsCode, 
        substring(wd.k, 0, 2) AS HsGroup, 
        cc.Alpha3Code AS CountryImporter, 
        cc2.Alpha3Code AS CountryExporter, 
        wd.v AS Value, 
        wd.q AS Volume, 
        wd.v/wd.q AS PriceTon 
    FROM (TradeData wd JOIN CountryCodes cc ON wd.i = cc.numeric) wdcc 
        JOIN CountryCodes cc2 ON wdcc.j == cc2.numeric 
)

