WITH source_data as (

    SELECT * FROM {{source("facebook_ads","facebook_account")}}
),


formatted AS (

    SELECT 


        CAST(account_id AS STRING) AS account_id,

        CAST(account_name AS STRING) AS account_name,
        CAST(ad_currency_code AS STRING) AS ad_currency_code,

        CAST(account_created_at AS TIMESTAMP) AS account_created_at,
        CAST(account_updated_at AS TIMESTAMP) AS account_updated_at

    FROM
        source_data
)

SELECT * FROM formatted