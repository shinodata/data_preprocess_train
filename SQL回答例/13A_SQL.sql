SELECT
　　*,
　LAG(total_price, 2) OVER
    (PARTITION BY customer_id ORDER BY cast(reserve_datetime as timestamp)) AS before_price

FROM reserve

