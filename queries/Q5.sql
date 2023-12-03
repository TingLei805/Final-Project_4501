
SELECT
    z."ZIPCODE" as zip_code,
    COUNT(*) as tree_count
FROM
    "NYC_Tree" t
JOIN
    "ZipCode" z ON ST_Within(ST_SetSRID(ST_MakePoint(t."Longitude", t."Latitude"), 4326), z.geometry)
GROUP BY z."ZIPCODE"
ORDER BY tree_count DESC
LIMIT 10;
