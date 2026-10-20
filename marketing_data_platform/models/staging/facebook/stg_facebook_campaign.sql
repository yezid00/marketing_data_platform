WITH source_data AS (

    SELECT * FROM {{ source('facebook_ads', 'facebook_campaign') }}

    {{ add_rows_limit() }}
),

formatted AS (

    SELECT
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(campaign_name AS STRING) AS campaign_name,
        CAST(campaign_updated_at AS TIMESTAMP) AS campaign_updated_at
    FROM source_data

)

SELECT * FROM formatted