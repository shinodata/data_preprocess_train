-- WITH句によって、一時テーブルreserve_tb_randomを生成
WITH reserve_tb_random AS(
  SELECT
    *,
    FIRST_VALUE(RANDOM()) OVER (PARTITION BY customer_id) AS random_num
  FROM reserve
)

SELECT *
FROM reserve_tb_random

-- 50%サンプリング、customer_idごとに設定された乱数が0.5以下の場合に抽出
WHERE random_num <= 0.5
