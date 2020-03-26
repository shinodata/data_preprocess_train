customer['join_key'] = 0
month_mst['join_key'] = 0

month_mst['year_month'] = month_mst['month_first_day'] \
  .apply(lambda x: pd.to_datetime(x, format='%Y-%m-%d').strftime("%Y%m"))


# customer_tbとmonth_mstを準備した結合キーで内部結合し、全結合を実現
customer_mst = pd.merge(
  customer[['customer_id', 'join_key']], month_mst, on='join_key'
)

# 年月の結合キーを予約テーブルで準備
reserve['year_month'] = reserve['checkin_date'] \
  .apply(lambda x: pd.to_datetime(x, format='%Y-%m-%d').strftime("%Y%m"))

# 予約レコードと結合し、合計利用金額を計算
summary_result = pd.merge(
  customer_mst,
  reserve[['customer_id', 'year_month', 'total_price']],
  on=['customer_id', 'year_month'], how='left'
).groupby(['customer_id', 'year_month'])["total_price"] \
 .sum().reset_index()

# 予約レコードがなかった場合の合計金額を値なしから0に変換
summary_result.fillna(0, inplace=True)

