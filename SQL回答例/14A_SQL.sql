SELECT
  *,
  CASE WHEN
　　COUNT(total_price) OVER
    (PARTITION BY customer_id ORDER BY 　　　　　cast(reserve_datetime as TIMESTAMP) ROWS
        BETWEEN 2 PRECEDING AND CURRENT ROW) = 3

  THEN

    -- 自身を含めた3件の合計金額を計算
    SUM(total_price) OVER
    (PARTITION BY customer_id ORDER BY reserve_datetime ROWS
        BETWEEN 2  PRECEDING AND CURRENT ROW)

  ELSE NULL END AS price_sum

FROM reserve
