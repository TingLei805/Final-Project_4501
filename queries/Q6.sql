
SELECT
    "ID",
    "ZipCode",
    "Species",
    "Status",
    "Health",
    CONCAT("Latitude", ', ', "Longitude") AS LatLng
FROM
    "NYC_Tree"
WHERE
    ST_DWithin(
        ST_MakePoint(-73.96253174434912, 40.80737875669467)::geography,
        ST_MakePoint("Longitude", "Latitude")::geography,
        0.5 * 1609.34
    );
