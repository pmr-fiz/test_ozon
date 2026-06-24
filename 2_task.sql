SELECT DISTINCT s.sailor_id, s.full_name, s.years
FROM sailors s
JOIN logs l
	ON s.sailor_id = l.captain_id
	OR s.sailor_id = l.first_officer_id
JOIN ships sh ON l.ship_id = sh.ship_id
WHERE s.years < 25
	AND sh.type_flag = 0
	AND sh.capacity > 100;
