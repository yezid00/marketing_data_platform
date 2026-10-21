WITH stats AS (

    SELECT * FROM {{ ref('stg_facebook_ads_stats') }}

),

ads AS (

    SELECT ad_id, campaign_id FROM {{ ref('stg_facebook_ads') }}

),

campaigns AS (

    SELECT campaign_id, campaign_name FROM {{ ref('stg_facebook_campaign') }}

),

accounts AS (

    SELECT account_id, ad_currency_code FROM {{ ref('stg_facebook_account') }}

)

SELECT
    'facebook' AS platform,
    stats.ad_id,
    stats.report_date,
    ads.campaign_id,
    campaigns.campaign_name,
    accounts.ad_currency_code AS currency_code,
    CAST(stats.spend AS DECIMAL(18, 6)) AS spend,
    stats.impressions,
    stats.clicks,
    stats.clicks IS NOT NULL AS is_clicks_reported
FROM stats
LEFT JOIN ads ON stats.ad_id = ads.ad_id
LEFT JOIN campaigns ON ads.campaign_id = campaigns.campaign_id
LEFT JOIN accounts ON stats.account_id = accounts.account_id