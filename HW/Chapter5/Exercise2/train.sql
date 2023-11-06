-- 5.2.1
SELECT `users`.`id`, `users`.`name`, seat_number 
FROM trains INNER JOIN tickets ON `tickets`.`train` = `trains`.`id` INNER JOIN users ON `tickets`.`user` = `users`.`id`
WHERE `trains`.`id` = 11
ORDER BY seat_number;
-- 5.2.2
SELECT `users`.`id`, `users`.`name`, COUNT(*) AS trains_count, SUM(`trains`.`distance`) * .1 AS total_distance
FROM users INNER JOIN tickets ON `users`.`id` = `tickets`.`user` INNER JOIN trains ON `tickets`.`train` = `trains`.`id`
GROUP BY `users`.`id`
ORDER BY total_distance DESC
LIMIT 6;
-- 5.2.3
SELECT `trains`.`id` AS ID, `types`.name AS type, `src`.`name` AS src_stn, `dst`.`name` AS dst_stn, Timediff(`arrival`, `departure`) AS travel_time
FROM trains INNER JOIN stations AS src ON `trains`.`source` = `src`.`id` INNER JOIN stations AS dst ON `trains`.`destination` = `dst`.`id` INNER JOIN types ON `types`.`id` = `trains`.`type`
ORDER BY travel_time DESC
LIMIT 6;
-- 5.2.4
SELECT `types`.`name` AS type, `src`.`name` AS src_stn, `dst`.`name` AS dst_stn, departure, arrival, Round(`trains`.`distance`/ 10 * `types`.`fare_rate` / 100, -2) AS fare
FROM trains INNER JOIN stations AS src ON `trains`.`source` = `src`.`id` INNER JOIN stations AS dst ON `trains`.`destination` = `dst`.`id` INNER JOIN types ON `trains`.`type` = `types`.`id`
ORDER BY departure ASC;
-- 5.2.5
SELECT `trains`.`id` AS id, `types`.`name` AS type, `src`.`name` AS src_stn, `dst`.`name` AS dst_stn, Count(*) AS occupied, max_seats AS maximum
FROM trains INNER JOIN stations AS src ON `trains`.`source` = `src`.`id` INNER JOIN stations AS dst ON `trains`.`destination` = `dst`.`id` INNER JOIN types ON `trains`.`type` = `types`.`id` INNER JOIN tickets ON `trains`.`id` = `tickets`.`train`
GROUP BY id
ORDER BY id ASC;
-- 5.2.6
SELECT `trains`.`id` AS id, `types`.`name` AS type, `src`.`name` AS src_stn, `dst`.`name` AS dst_stn, Count(`tickets`.`id`) AS occupied, max_seats AS maximum
FROM trains INNER JOIN stations AS src ON `trains`.`source` = `src`.`id` INNER JOIN stations AS dst ON `trains`.`destination` = `dst`.`id` INNER JOIN types ON `trains`.`type` = `types`.`id` LEFT OUTER JOIN tickets ON `trains`.`id` = `tickets`.`train`
GROUP BY `tickets`.`train`
ORDER BY id ASC;