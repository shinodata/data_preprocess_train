reserve['reserve_datetime'] = pd.to_datetime(
  reserve['reserve_datetime'], format='%Y-%m-%d %H:%M:%S'
)

# log_noを新たな列として追加
# 集約単位の指定はgroup_byを利用
# 顧客ごとにまとめたreserve_datetimeを生成し、rank関数によって順位を生成
# ascendingをTrueにすることで昇順に設定(Falseだと降順に設定)
reserve['log_no'] = reserve \
  .groupby('customer_id')['reserve_datetime'] \
  .rank(ascending=True, method='first')
