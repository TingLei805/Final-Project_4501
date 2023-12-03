
WITH
  zillow_ranked_rent AS (
    SELECT
        "Rent",
        "ZipCode",
        ROW_NUMBER() OVER (ORDER BY "Rent") as rent_row_num_asc,
        ROW_NUMBER() OVER (ORDER BY "Rent" DESC) as rent_row_num_desc
    FROM
        "Zillow"
    WHERE
        "Time" = '2023-01-31'
  ),
  tree_count AS (
    SELECT
        "ZipCode",
        COUNT(*) AS tree_count
    FROM
        "NYC_Tree"
    GROUP BY
        "ZipCode"
  ),
  complaint_count AS (
    SELECT
        "ZipCode",
        COUNT(*) AS complaint_count
    FROM
        "NYC_311"
    GROUP BY
        "ZipCode"
  )

SELECT a."Rent", a."ZipCode", b.tree_count, c.complaint_count
FROM (
    SELECT "Rent", "ZipCode"
    FROM zillow_ranked_rent
    WHERE
        rent_row_num_asc <= 5
        OR rent_row_num_desc <= 5
) AS a
LEFT JOIN tree_count AS b ON a."ZipCode" = b."ZipCode"
LEFT JOIN complaint_count AS c ON a."ZipCode" = c."ZipCode";
