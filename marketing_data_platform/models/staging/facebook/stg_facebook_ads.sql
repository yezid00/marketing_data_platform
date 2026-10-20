WITH source_data AS (

    SELECT * FROM {{ source('facebook_ads', 'facebook_ads') }}

),

formatted AS (

    SELECT
        CAST(ad_id AS STRING) AS ad_id,
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(ad_group_id AS STRING) AS ad_group_id,
        CAST(account_id AS STRING) AS account_id,
        CAST(ad_name AS STRING) AS ad_name,
        UPPER(CAST(ad_status AS STRING)) AS ad_status,
        CAST(ad_updated_at AS TIMESTAMP) AS ad_updated_at
    FROM source_data

)

SELECT * FROM formatted