

SELECT
    ad_daily_key,
    {{ dbt_utils.generate_surrogate_key(['platform', 'campaign_id']) }} AS campaign_key,
    platform,
    report_date,
    ad_id,
    campaign_id,
    campaign_name,
    currency_code,
    spend,
    impressions,
    clicks,
    is_clicks_reported,
    {{ safe_divide('clicks', 'impressions') }} AS ctr,
    {{ safe_divide('spend', 'clicks') }} AS cpc,
    {{ safe_divide('spend * 1000', 'impressions') }} AS cpm
FROM {{ ref('int_marketing_ads') }}