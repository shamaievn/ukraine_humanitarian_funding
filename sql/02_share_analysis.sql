-- Mine Action Share of Total Humanitarian Envelope
-- Compares requirements share vs funding share to identify donor priorities

-- PART 1: Mine Action share of REQUIREMENTS
WITH total_requirements AS (
    SELECT 
        year,
        SUM(requirements_usd) AS total_req
    FROM fts.requirements_funding_globalcluster
    WHERE cluster NOT IN ('Not specified', 'Multiple clusters/sectors (shared)')
    GROUP BY year
),
mine_action_requirements AS (
    SELECT 
        year,
        SUM(requirements_usd) AS mine_action_req
    FROM fts.requirements_funding_globalcluster
    WHERE cluster = 'Protection - Mine Action'
    GROUP BY year
)
SELECT 
    t.year,
    t.total_req,
    ma.mine_action_req,
    ROUND((ma.mine_action_req / t.total_req) * 100, 2) AS share_pct
FROM total_requirements t
JOIN mine_action_requirements ma ON t.year = ma.year
ORDER BY year DESC;

-- PART 2: Mine Action share of FUNDING
WITH total_funding AS (
    SELECT 
        year,
        SUM(funding_usd) AS total_fund
    FROM fts.requirements_funding_globalcluster
    WHERE cluster NOT IN ('Not specified', 'Multiple clusters/sectors (shared)')
    GROUP BY year
),
mine_action_funding AS (
    SELECT 
        year,
        SUM(funding_usd) AS mine_action_fund
    FROM fts.requirements_funding_globalcluster
    WHERE cluster = 'Protection - Mine Action'
    GROUP BY year
)
SELECT 
    t.year,
    t.total_fund,
    ma.mine_action_fund,
    ROUND((ma.mine_action_fund / t.total_fund) * 100, 2) AS share_pct
FROM total_funding t
JOIN mine_action_funding ma ON t.year = ma.year
ORDER BY year DESC;
