create definer = root@`%` view product_performance_matrix as
select `p`.`id`                                        AS `product_id`,
       `p`.`title`                                     AS `product_name`,
       `p`.`price`                                     AS `list_price`,
       `p`.`stock`                                     AS `current_stock`,
       count(`oi`.`id`)                                AS `times_ordered`,
       sum(`oi`.`quantity`)                            AS `total_quantity_sold`,
       (`p`.`stock` / nullif(avg(`oi`.`quantity`), 0)) AS `estimated_weeks_of_inventory`,
       (case
            when ((count(`oi`.`id`) > 10) and (`p`.`stock` < 5)) then 'High demand, Low stock'
            when ((count(`oi`.`id`) > 10) and (`p`.`stock` >= 5)) then 'High demand, Adequate stock'
            when ((count(`oi`.`id`) <= 10) and (`p`.`stock` < 5)) then 'Low demand, Low stock'
            when ((count(`oi`.`id`) <= 10) and (`p`.`stock` >= 5)) then 'Low demand, High stock'
            else 'Unknown' end)                        AS `inventory_status`
from (`mydb`.`Products` `p` left join `mydb`.`OrderItems` `oi` on ((`p`.`id` = `oi`.`productId`)))
group by `p`.`id`, `p`.`title`, `p`.`price`, `p`.`stock`;

