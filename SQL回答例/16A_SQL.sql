SELECT
  a.reserve_id,
  a.hotel_id,
  a.customer_id,
  a.reserve_datetime,
  a.checkin_date,
  a.checkin_time,
  a.checkout_date,
  a.people_num,
  a.total_price,
	-- 対象の件数が0件の場合は0、1件以上ある場合は合計金額を計算
  COALESCE(SUM(b.total_price), 0) AS price_sum
FROM reserve as a
LEFT JOIN reserve as b
  ON a.customer_id = b.customer_id

  AND cast(a.reserve_datetime as timestamp) > cast(b.reserve_datetime as timestamp)

  AND DATE_ADD('day', -90, cast(a.reserve_datetime as timestamp)) <= cast(b.reserve_datetime as timestamp)

-- 結合元の予約テーブルのすべてのデータ列で集約
GROUP BY a.reserve_id, a.hotel_id, a.customer_id,
  a.reserve_datetime, a.checkin_date, a.checkin_time, a.checkout_date,
  a.people_num, a.total_price
order by a.customer_id, a.reserve_datetime
