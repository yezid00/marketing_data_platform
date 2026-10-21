WITH unioned AS (

    SELECT * FROM {{ ref('int_facebook_ads_daily') }}
    UNION ALL
    SELECT * FROM {{ ref('int_snapchat_ads_daily') }}

)

SELECT
    {{ dbt_utils.generate_surrogate_key(['platform', 'ad_id', 'report_date']) }} AS ad_daily_key,
    *
FROM unioned