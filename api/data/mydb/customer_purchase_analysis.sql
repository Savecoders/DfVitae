create definer = root@`%` view customer_purchase_analysis as
select `u`.`id`                                                        AS `user_id`,
       `u`.`name`                                                      AS `customer_name`,
       count(`o`.`id`)                                                 AS `total_orders`,
       sum(`o`.`totalPrice`)                                           AS `total_spent`,
       avg(`o`.`totalPrice`)                                           AS `average_order_value`,
       min(`o`.`createdAt`)                                            AS `first_purchase_date`,
       max(`o`.`createdAt`)                                            AS `last_purchase_date`,
       (to_days(max(`o`.`createdAt`)) - to_days(min(`o`.`createdAt`))) AS `days_as_customer`
from (`mydb`.`User` `u` left join `mydb`.`Orders` `o` on ((`u`.`id` = `o`.`userId`)))
where (`o`.`status` = 'completed')
group by `u`.`id`, `u`.`name`
order by `total_spent` desc;

