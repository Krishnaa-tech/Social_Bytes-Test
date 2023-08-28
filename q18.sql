WITH Points AS (
    SELECT
        'Point A' AS PointName,
        -1 AS X,
        -1 AS Y
    UNION ALL
    SELECT
        'Point B' AS PointName,
        0 AS X,
        0 AS Y
    UNION ALL
    SELECT
        'Point C' AS PointName,
        -1 AS X,
        -2 AS Y
)
SELECT
    p1.PointName AS PointFrom,
    p2.PointName AS PointTo,
    SQRT(POWER(p2.X - p1.X, 2) + POWER(p2.Y - p1.Y, 2)) AS Distance
FROM Points p1
CROSS JOIN Points p2
WHERE p1.PointName <> p2.PointName;
