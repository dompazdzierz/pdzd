USE data;
LOAD DATA INPATH '/tmp/hadoop/trade_data.csv' OVERWRITE INTO TABLE TradeDataTemp;

MERGE INTO TradeData AS T
USING TradeDataTemp AS S
ON  T.t == S.t 
    AND T.k == S.k   
    AND T.i == S.i
    AND T.j == S.j
WHEN MATCHED THEN UPDATE SET v = S.v, q = S.q
WHEN NOT MATCHED THEN INSERT VALUES (S.t, S.k, S.i, S.j, S.v, S.q);


