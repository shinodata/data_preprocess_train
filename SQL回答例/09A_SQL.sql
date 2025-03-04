SELECT
  ROUND(total_price, -3) AS total_price_round
FROM reserve
GROUP BY ROUND(total_price, -3)

-- COUNT関数で算出した金額別の予約数を大きい順に並び替え(DESCを付けると昇順)
ORDER BY COUNT(*) DESC

-- LIMIT句で最初の1件のみ結果を取得
LIMIT 1

