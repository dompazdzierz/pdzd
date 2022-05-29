INSERT OVERWRITE TABLE WTD_TMP1 
    SELECT 
        wd.t AS Year, 
        wd.k AS HsCode, 
        SUBSTRING(wd.k, 0, 2) AS HsGroup, 
        cc.Alpha3Code AS CountryImporter, 
        cc2.Alpha3Code AS CountryExporter, 
        wd.v AS Value, 
        wd.q AS Volume, 
        wd.v/wd.q AS PriceTon 
    FROM 
        TradeData AS wd 
        JOIN CountryCodes AS cc ON wd.i = cc.NumericCode  
        JOIN CountryCodes AS cc2 ON wd.j == cc2.NumericCode;

