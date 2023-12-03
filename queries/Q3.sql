
SELECT
    t.zip_code,
    ROUND(z."Rent"::numeric, 2) as rent,
    t.tree_count
FROM
    "Zillow" as z
RIGHT JOIN (
    SELECT
        "ZipCode" AS zip_code,
        COUNT(*) AS tree_count
    FROM
        "NYC_Tree"
    GROUP BY
        "ZipCode"
    ORDER BY
        tree_count DESC
    LIMIT 10
) AS t ON z."ZipCode" = t.zip_code
WHERE
    z."Time" = '2023-08-31';
