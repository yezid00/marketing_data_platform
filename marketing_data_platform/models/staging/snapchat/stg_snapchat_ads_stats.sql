WITH source_data AS (

    SELECT * FROM {{ source('snapchat_ads', 'snapchat_ads_stats') }}

),

formatted AS (

    SELECT
        CAST(ad_detail_id AS STRING) AS ad_id,
        CAST(ad_date AS DATE) AS report_date,
        UPPER(TRIM(ad_currency_code)) AS currency_code,
        LOWER(TRIM(ad_country)) AS country_code,
        CAST(ad_spend AS DECIMAL(18, 6)) AS spend,
        CAST(ad_impressions AS BIGINT) AS impressions,
        CASE WHEN LOWER(TRIM(ad_clicks)) = 'null' THEN NULL
             ELSE CAST(ad_clicks AS BIGINT) END AS clicks
    FROM source_data

)

SELECT * FROM formatted