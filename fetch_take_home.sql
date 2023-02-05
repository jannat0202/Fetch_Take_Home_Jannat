#Which brand saw the most dollars spent in the month of June?
SELECT B.NAME FROM BRANDS B
INNER JOIN RECEIPT_ITEMS RI
ON B.BARCODE=RI.BARCODE
INNER JOIN RECEIPTS R
ON RI.REWARDS_RECEIPT_ID=R.ID
WHERE MONTH(R.PURCHASE_DATE)=6
GROUP BY B.NAME
ORDER BY SUM(RI.TOTAL_FINAL_PRICE) DESC
LIMIT 1;


#Which user spent the most money in the month of August?
select users.ID as UserID, receipts.TOTAL_SPENT
from users
inner join receipts on users.ID = receipts.USER_ID
where cast(receipts.TOTAL_SPENT as float) = (select max(cast(TOTAL_SPENT as float)) from receipts 
where month(PURCHASE_DATE) = 8);

#What user bought the most expensive item?
SELECT U.ID FROM USERS U
INNER JOIN RECEIPTS R
ON U.ID=R.USER_ID
INNER JOIN RECEIPT_ITEMS RI
ON R.ID=RI.REWARDS_RECEIPT_ID
ORDER BY CAST((RI.TOTAL_FINAL_PRICE/RI.QUANTITY_PURCHASED) as DECIMAL(7,2)) DESC;


#What is the name of the most expensive item purchased?
select Description as Item_Name,cast(TOTAL_FINAL_PRICE as float)/cast(QUANTITY_PURCHASED as float) as UNIT_PRICE from receipt_items
where cast(TOTAL_FINAL_PRICE as float)/cast(QUANTITY_PURCHASED as float) = (select max(cast(TOTAL_FINAL_PRICE as float)/cast(QUANTITY_PURCHASED as float)) FROM receipt_items);


#How many users scanned in each month?
select month(receipts.DATE_SCANNED) AS MONTH, Count(receipts.ID)
from users
inner join receipts on users.ID = receipts.USER_ID
group by month(receipts.DATE_SCANNED) 
order by MONTH asc;

