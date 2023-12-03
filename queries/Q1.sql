
SELECT
    "ZipCode" AS zip_code,
    COUNT(*) AS number_of_311_complaints
FROM
    "NYC_311"
WHERE
    "Time" BETWEEN '2022-10-01 00:00:00' AND '2023-09-30 23:59:59'
GROUP BY
    "ZipCode"
ORDER BY
    number_of_311_complaints DESC;
