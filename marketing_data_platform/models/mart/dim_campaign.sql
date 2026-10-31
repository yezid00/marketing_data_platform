WITH campaigns AS (

    SELECT DISTINCT platform,campaign_id,campaign_name
    FROM {{ ref ('int_marketing_ads') }}

    WHERE campaign_id IS NOT NULL
)


SELECT 
{{ dbt_utils.generate_surrogate_key(['platform', 'campaign_id']) }} AS campaign_key,
    platform,
    campaign_id,
    campaign_name
FROM campaigns