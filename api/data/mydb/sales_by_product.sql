create definer = root@`%` view sales_by_product as
select `p`.`id`                              AS `product_id`,
       `p`.`title`                           AS `product_name`,
       count(`oi`.`id`)                      AS `total_orders`,
       sum(`oi`.`quantity`)                  AS `units_sold`,
       sum((`oi`.`price` * `oi`.`quantity`)) AS `revenue`,
       avg(`oi`.`price`)                     AS `average_price`,
       max(`oi`.`createdAt`)                 AS `last_order_date`
from ((`mydb`.`Products` `p` left join `mydb`.`OrderItems` `oi`
       on ((`p`.`id` = `oi`.`productId`))) left join `mydb`.`Orders` `o` on ((`oi`.`orderId` = `o`.`id`)))
where (`o`.`status` = 'completed')
group by `p`.`id`, `p`.`title`
order by `revenue` desc;

