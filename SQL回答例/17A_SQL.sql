SELECT
    cus.customer_id,

    -- 年月マスタから年を取得
    mst.year_num,
    -- 年月マスタから月を取得
    mst.month_num,
    -- 該当のtotal_priceがある場合は足し合わせ、ない場合は0を足し合わせる
    SUM(COALESCE(rsv.total_price, 0)) AS total_price_month

FROM customer as cus

-- 顧客テーブルと年月マスタと全結合
CROSS JOIN month_mst as mst

-- 顧客テーブルと年月マスタと予約テーブルを結合
LEFT JOIN reserve as rsv
  ON cus.customer_id = rsv.customer_id
    AND cast(mst.month_first_day as date) <= cast(rsv.checkin_date as date)
    AND cast(mst.month_last_day as date) >= cast(rsv.checkin_date as date)

-- 年月マスタの対象期間を絞り込み
WHERE cast(mst.month_first_day as date) >= cast('2017-01-01' as date)
  AND cast(mst.month_first_day as date) < cast('2017-04-01' as date)
GROUP BY cus.customer_id, mst.year_num, mst.month_num
order by customer_id,year_num,month_num

