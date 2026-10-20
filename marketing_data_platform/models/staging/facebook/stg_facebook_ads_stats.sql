WITH source_data AS (

    SELECT * FROM {{ source('facebook_ads', 'facebook_ads_stats') }}

    {{ add_rows_limit() }}
),

formatted AS (

    SELECT
        CAST(ad_id AS STRING) AS ad_id,
        CAST(account_id AS STRING) AS account_id,
        CAST(ad_date AS DATE) AS report_date,
        CAST(ad_spend AS DECIMAL(18, 4)) AS spend,
        TRY_CAST(ad_impressions AS BIGINT) AS impressions,
        TRY_CAST(ad_clicks AS BIGINT) AS clicks
    FROM source_data

)

SELECT
    *
FROM formatted