result = reserve_tb \
  .groupby('hotel_id') \
  .agg({'reserve_id': 'count', 'customer_id': 'nunique'})

# reset_index関数によって、列番号を振り直す（inplace=Trueなので、直接resultを更新）
result.reset_index(inplace=True)
result.columns = ['hotel_id', 'rsv_cnt', 'cus_cnt']
