select
    date_date,
    count(distinct orders_id) as nb_transactions,
    round(sum(revenue), 2) as revenue,
    round(sum(quantity), 2) as quantity,
    round(sum(purchase_cost), 2) as purchase_cost,
    round(sum(margin), 2) as margin,
    round(sum(shipping_fee), 2) as shipping_fee,
    round(sum(logCost), 2) as log_cost,
    round(sum(ship_cost), 2) as ship_cost,
    round(sum(revenue) / count(distinct orders_id), 2) as average_basket,
    round(sum(operational_margin), 2) as operational_margin
from {{ ref('int_orders_operational') }}
group by date_date
order by date_date desc