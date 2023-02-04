#Which user spent the most money in the month of August?
select users.ID as UserID, receipts.TOTAL_SPENT
from users
inner join receipts on users.ID = receipts.USER_ID
where cast(receipts.TOTAL_SPENT as float) = (select max(cast(TOTAL_SPENT as float)) from receipts 
where month(PURCHASE_DATE) = 8);


#What is the name of the most expensive item purchased?
select REWARDS_RECEIPT_ID, Description as Item_Name,cast(TOTAL_FINAL_PRICE as float)/cast(QUANTITY_PURCHASED as float) as UNIT_PRICE from receipt_items
where cast(TOTAL_FINAL_PRICE as float)/cast(QUANTITY_PURCHASED as float) = (select max(cast(TOTAL_FINAL_PRICE as float)/cast(QUANTITY_PURCHASED as float)) FROM receipt_items);


#How many users scanned in each month?
select month(receipts.DATE_SCANNED) AS MONTH, Count(receipts.ID)
from users
inner join receipts on users.ID = receipts.USER_ID
group by month(receipts.DATE_SCANNED) 
order by MONTH asc;