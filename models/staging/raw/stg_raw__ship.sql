with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        cast(orders_id as int64) as orders_id,
        cast(shipping_fee as float64) as shipping_fee,
        cast(logCost as float64) as logCost,
        cast(ship_cost as float64) as ship_cost

    from source

)

select * from renamed