--Limitでの条件はSQLの最後の処理のため、事前にデータが絞れるなら絞ること！
--回答③はpresto独自関数のため注意


--回答①（よくない例）
SELECT *
FROM reserve
ORDER BY RANDOM()
LIMIT 2000


--回答②
SELECT *
FROM reserve
WHERE RANDOM() <= 0.5


--回答③
select *FROM reserve TABLESAMPLE BERNOULLI(50)

