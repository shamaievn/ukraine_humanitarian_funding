-- Top 5 clusters by absolute funding growth
-- Excludes administrative categories to focus on operational sectors

-- CTE 1: Total funding per cluster in 2021 (pre-war baseline)
WITH funding_by_cluster_2021 AS (
    SELECT 
        cluster, 
        SUM(funding_usd) AS funding_2021
    FROM fts.requirements_funding_globalcluster
    WHERE year = 2021
      AND cluster NOT IN ('Multi-sector', 'Multipurpose Cash', 'Not specified', 'Multiple clusters/sectors (shared)')
    GROUP BY cluster
),
-- CTE 2: Total funding per cluster in 2025 (recent year of the ongoing war)
funding_by_cluster_2025 AS (
    SELECT 
        cluster, 
        SUM(funding_usd) AS funding_2025
    FROM fts.requirements_funding_globalcluster
    WHERE year = 2025
      AND cluster NOT IN ('Multi-sector', 'Multipurpose Cash', 'Not specified', 'Multiple clusters/sectors (shared)')
    GROUP BY cluster
)
-- Main query: Calculate absolute and percentage growth, rank by absolute
SELECT 
    f21.cluster,
    f21.funding_2021,
    f25.funding_2025,
    (f25.funding_2025 - f21.funding_2021) AS absolute_growth,
    ROUND(
        ((f25.funding_2025 - f21.funding_2021) / NULLIF(f21.funding_2021, 0)) * 100, 
        2
    ) AS growth_pct
FROM funding_by_cluster_2021 f21
JOIN funding_by_cluster_2025 f25 ON f21.cluster = f25.cluster
ORDER BY absolute_growth DESC
LIMIT 5;
