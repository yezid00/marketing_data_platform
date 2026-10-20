WITH source_data AS (

    SELECT * FROM {{ source('snapchat_ads', 'snapchat_ads_campaign') }}

),

formatted AS (

    SELECT
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(account_id AS STRING) AS account_id,
        CAST(campaign_name AS STRING) AS campaign_name
    FROM source_data

)

SELECT * FROM formatted