pd.merge(reserve.query('people_num == 1'),
         hotel.query('is_business'),
         on='hotel_id', how='inner')

