result = reserve \
  .groupby('hotel_id') \
  .agg({'total_price': ['var', 'std']}).reset_index()
result.columns = ['hotel_id', 'price_var', 'price_std']

# データ数が1件だったときは、分散値と標準偏差値がnaになっているので、0に置き換え
result.fillna(0, inplace=True)

