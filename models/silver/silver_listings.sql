{{ config(
    materialized='incremental',
    keys='LISTING_ID') 
}}
SELECT  LISTING_ID,
        HOST_ID,
        PROPERTY_TYPE,
        ROOM_TYPE,
        CITY,
        COUNTRY,
        ACCOMMODATES,
        BEDROOMS,
        BATHROOMS,
        PRICE_PER_NIGHT,
        {{ tag('CAST(price_per_night as INT)') }} as PRICE_PER_NIGHT_TAG,
        CREATED_AT
    FROM
        {{ ref('bronze_listings')}}
