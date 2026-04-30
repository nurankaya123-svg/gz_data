select
    m.orders_id,
    m.date_date,
    round(
        m.margin + s.shipping_fee - s.logCost - s.ship_cost,
        2
    ) as operational_margin,
    m.quantity,
    m.revenue,
    m.purchase_cost,
    m.margin,
    s.shipping_fee,
    s.logCost,
    s.ship_cost
from {{ ref('int_orders_margin') }} m
left join {{ ref('stg_raw__ship') }} s
    on m.orders_id = s.orders_id