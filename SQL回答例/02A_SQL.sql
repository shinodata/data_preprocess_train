-- 回答①はWhere条件のカラム名を2か所に記載する必要あるため△
-- SQLの変更を考慮して、変数名の記述は少なくするのが良


回答①
SELECT *
FROM reserve
WHERE checkin_date >= '2016-10-12' 
        AND checkin_date <= '2016-10-13'



回答②
SELECT *
FROM reserve
WHERE checkout_date BETWEEN '2016-10-13' AND '2016-10-14'
