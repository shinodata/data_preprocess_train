reserve['price_sum'] = pd.Series(reserve.groupby('customer_id') \
.apply(lambda x: x.sort_values(by='reserve_datetime', ascending=True)) \
    .loc[:, 'total_price'].rolling(center=False, window=3, min_periods=3).sum()
    .reset_index(drop=True)
)
