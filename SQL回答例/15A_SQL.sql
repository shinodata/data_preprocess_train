SELECT
  *,

  AVG(total_price) OVER
    (PARTITION BY customer_id ORDER BY 
        reserve_datetime ROWS
            BETWEEN 3 PRECEDING AND 1 
                    PRECEDING) AS price_avg

FROM reserve
