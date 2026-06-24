SELECT s.sailor_id, s.full_name, COUNT(l.log_id) AS cargo_trips
FROM sailors s
LEFT JOIN logs l --LEFT JOIN чтобы включить капитанов с 0 рейсов
	ON s.sailor_id = l.captain_id
	AND l.ship_id IN (SELECT ship_id FROM ships WHERE type_flag = 1)
  AND EXTRACT(YEAR FROM l.sail_date) = EXTRACT(YEAR FROM CURRENT_DATE)
WHERE s.rank = 'Капитан'
GROUP BY s.sailor_id, s.full_name
ORDER BY cargo_trips ASC
LIMIT 5;
