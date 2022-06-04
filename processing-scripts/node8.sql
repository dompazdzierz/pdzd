INSERT OVERWRITE
TABLE MIX_TMP2
SELECT
    Year,
    CountryExporter,
    RegionExporter,
    SUM(Value) as ValueSum,
    SUM(Volume) as VolumeSum
FROM MIX_TMP1
GROUP BY Year, CountryExporter;
