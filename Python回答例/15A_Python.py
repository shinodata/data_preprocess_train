reserve['price_avg'] = pd.Series(
      reserve.groupby('customer_id') \
    .apply(lambda x: x.sort_values(by='reserve_datetime', ascending=True))
    ['total_price'].rolling(center=False, window=3, min_periods=1).mean()
    .reset_index(drop=True)
)


reserve['price_avg'] = \
  reserve.groupby('customer_id')['price_avg'].shift(periods=1)

