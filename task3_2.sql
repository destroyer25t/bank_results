SELECT client_id, COUNT(created) AS count_created, COUNT(closed) AS count_closed FROM account GROUP BY client_id HAVING count_created=count_closed;