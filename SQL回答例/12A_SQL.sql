SELECT
    A.*
FROM reserve as A
JOIN hotel as B
  ON A.hotel_id = B.hotel_id

-- ホテルテーブルからビジネスホテルのデータのみ抽出
WHERE B.is_business = 'true'

-- 予約テーブルからビジネスホテルのデータのみ抽出
  AND A.people_num = 1

