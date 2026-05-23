-- Query 1: All clusters funding by year

SELECT 
    cluster, 
    year, 
    SUM(funding_usd) AS total_funding
FROM fts.requirements_funding_globalcluster rfg 
WHERE CLUSTER NOT IN ('Multipurpose Cash', 'Multi-sector', 'Multipurpose Cash', 'Other', 'Not specified', 'Multiple clusters/sectors (shared)')
GROUP BY cluster, year
ORDER BY year, cluster 

--Query 2: All Clusters Summary
SELECT 
    year,
    cluster,
    SUM(requirements_usd) AS requriements,
    SUM(funding_usd) AS funding,
    (SUM(funding_usd)-SUM(requirements_usd)) AS funding_gap,
    ROUND((SUM(funding_usd) / NULLIF(SUM(requirements_usd), 0)) * 100, 2) AS coverage_pct
FROM fts.requirements_funding_globalcluster rfg 
WHERE cluster NOT IN ('Multipurpose Cash', 'Multi-sector', 'Multipurpose Cash', 'Other', 'Not specified', 'Multiple clusters/sectors (shared)')
GROUP BY year, cluster
ORDER BY year DESC, funding DESC;

--Query 3: Aggregate Stats
SELECT 
    year,
    COUNT(DISTINCT cluster) AS active_clusters,
    SUM(funding_usd) AS total_funding,
    SUM(requirements_usd) AS total_requirements,
    ROUND((SUM(funding_usd) / NULLIF(SUM(requirements_usd), 0)) * 100, 2) AS avg_coverage_pct
FROM fts.requirements_funding_globalcluster rfg 
WHERE cluster NOT IN ('Multipurpose Cash', 'Multi-sector', 'Multipurpose Cash', 'Other', 'Not specified', 'Multiple clusters/sectors (shared)')
GROUP BY year
ORDER BY year DESC;

