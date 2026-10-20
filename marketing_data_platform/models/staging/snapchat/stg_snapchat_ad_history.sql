WITH source_data AS (

    SELECT * FROM {{ source('snapchat_ads', 'snapchat_ad_history') }}

),

formatted AS (

    SELECT
        CAST(ad_id AS STRING) AS ad_id,
        CAST(ad_group_id AS STRING) AS ad_group_id,
        CAST(ad_name AS STRING) AS ad_name,
        CAST(ad_detail_updated_at AS TIMESTAMP) AS ad_updated_at
    FROM source_data

)

SELECT * FROM formatted