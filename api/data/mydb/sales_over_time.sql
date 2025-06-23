create definer = root@`%` view sales_over_time as
select date_format(`o`.`createdAt`, '%Y-%m-%d') AS `date`,
       count(distinct `o`.`id`)                 AS `order_count`,
       sum(`o`.`totalPrice`)                    AS `daily_revenue`,
       avg(`o`.`totalPrice`)                    AS `average_order_value`,
       count(distinct `o`.`userId`)             AS `unique_customers`
from `mydb`.`Orders` `o`
where (`o`.`status` = 'completed')
group by date_format(`o`.`createdAt`, '%Y-%m-%d')
order by `date` desc;

