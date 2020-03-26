result = reserve \
  .groupby('customer_id') \
  .apply(lambda x:
         x.sort_values(by='reserve_datetime', axis=0, inplace=False))


result['before_price'] = \
  pd.Series(result['total_price'].shift(periods=2))


result.drop('customer_id',axis=1).reset_index()
