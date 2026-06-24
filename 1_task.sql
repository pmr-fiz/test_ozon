SELECT s.sailor_id, s.full_name
FROM sailors s
JOIN logs l
	ON s.sailor_id = l.captain_id --если кок не может быть капитаном, делаем JOIN только по first_officer_id
  OR s.sailor_id = l.first_officer_id 
WHERE s.rank = 'Кок'
	AND l.port = 'Восточная гавань'
	AND EXTRACT(MONTH FROM l.sail_date) = 11
	AND EXTRACT(YEAR FROM l.sail_date) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY s.sailor_id, s.full_name
HAVING COUNT(*) = 5;
