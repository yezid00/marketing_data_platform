WITH stats_by_day AS (

    SELECT
        ad_id,
        report_date,
        currency_code,
        SUM(spend) AS spend,
        SUM(impressions) AS impressions,
        SUM(clicks) AS clicks,
        COUNT(clicks) = COUNT(*) AS is_clicks_reported
    FROM {{ ref('stg_snapchat_ads_stats') }}
    GROUP BY ad_id, report_date, currency_code

),

ads AS (

    SELECT ad_id, ad_group_id FROM {{ ref('stg_snapchat_ad_history') }}

),

ad_groups AS (

    SELECT ad_group_id, campaign_id FROM {{ ref('stg_snapchat_ad_group') }}

),

campaigns AS (

    SELECT campaign_id, campaign_name FROM {{ ref('stg_snapchat_ads_campaign') }}

)

SELECT
    'snapchat' AS platform,
    stats_by_day.ad_id,
    stats_by_day.report_date,
    ad_groups.campaign_id,
    campaigns.campaign_name,
    stats_by_day.currency_code,
    CAST(stats_by_day.spend AS DECIMAL(18, 6)) AS spend,
    stats_by_day.impressions,
    stats_by_day.clicks,
    stats_by_day.is_clicks_reported
FROM stats_by_day
LEFT JOIN ads ON stats_by_day.ad_id = ads.ad_id
LEFT JOIN ad_groups ON ads.ad_group_id = ad_groups.ad_group_id
LEFT JOIN campaigns ON ad_groups.campaign_id = campaigns.campaign_id