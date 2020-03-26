target = pd.Series(reserve['customer_id'].unique()).sample(frac=0.5)

# isin関数によって、customer_idがサンプリングした顧客IDのいずれかに一致した行を抽出
reserve[reserve['customer_id'].isin(target)]
