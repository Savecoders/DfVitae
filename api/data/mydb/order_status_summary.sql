create definer = root@`%` view order_status_summary as
select `mydb`.`Orders`.`status`          AS `status`,
       count(0)                          AS `order_count`,
       sum(`mydb`.`Orders`.`totalPrice`) AS `total_value`,
       avg(`mydb`.`Orders`.`totalPrice`) AS `average_value`,
       min(`mydb`.`Orders`.`createdAt`)  AS `oldest_order`,
       max(`mydb`.`Orders`.`createdAt`)  AS `newest_order`
from `mydb`.`Orders`
group by `mydb`.`Orders`.`status`;

