rsv_cnt_tb = reserve.groupby('hotel_id').size().reset_index()
rsv_cnt_tb.columns = ['hotel_id', 'rsv_cnt']

# 予約回数をもとに順位を計算
# ascendingをFalseにすることで降順に指定
# methodをminに指定し、同じ値の場合は取り得る最小順位に指定
rsv_cnt_tb['rsv_cnt_rank'] = rsv_cnt_tb['rsv_cnt'] \
  .rank(ascending=False, method='min')

# 必要のないrsv_cntの列を削除
rsv_cnt_tb.drop('rsv_cnt', axis=1, inplace=True)
rsv_cnt_tb.sort_values('rsv_cnt_rank')

