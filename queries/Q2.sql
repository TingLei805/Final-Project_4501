
SELECT
    "ZipCode" AS zip_code,
    COUNT(*) AS top_tree_count
FROM
    "NYC_Tree"
GROUP BY
    "ZipCode"
ORDER BY
    top_tree_count DESC
LIMIT 10;
