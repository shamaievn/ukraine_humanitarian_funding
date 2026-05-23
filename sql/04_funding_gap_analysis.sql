-- Funding gap analysis: requirements vs actual funding by cluster and year
-- Negative gap = underfunded, positive gap = overfunded
-- Coverage % shows funding adequacy: <100% underfunded, >100% overfunded
-- NULL in requirements/funding indicates data not yet reported in FTS

SELECT 
    year, 
    cluster,
    SUM(requirements_usd) AS requirements_usd,
    SUM(funding_usd) AS funding_usd,
    (SUM(funding_usd) - SUM(requirements_usd)) AS gap_usd,
    ROUND((SUM(funding_usd) / NULLIF(SUM(requirements_usd), 0)) * 100, 2) AS coverage_pct
FROM fts.requirements_funding_globalcluster
WHERE cluster NOT IN ('Multi-sector', 'Multipurpose Cash', 'Not specified', 'Multiple clusters/sectors (shared)')
GROUP BY year, cluster
ORDER BY YEAR DESC, 
      gap_usd DESC;
