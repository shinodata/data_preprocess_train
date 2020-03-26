#回答①
reserve[(reserve_tb['checkout_date'] >= '2016-10-13') 	& (reserve_tb['checkout_date'] <= '2016-10-14')]



#回答②
reserve.query('"2016-10-13" <= checkout_date <= "2016-10-14"')

