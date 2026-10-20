WITH source_data AS (

    SELECT * FROM {{ source('snapchat_ads', 'snapchat_ad_group') }}

),

formatted AS (

    SELECT
        CAST(ad_group_id AS STRING) AS ad_group_id,
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(ad_group_name AS STRING) AS ad_group_name,
        CAST(ad_group_updated_at AS TIMESTAMP) AS ad_group_updated_at
    FROM source_data

)

SELECT * FROM formatted