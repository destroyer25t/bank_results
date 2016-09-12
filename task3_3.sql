/* Самые ценные клиенты банка - те, что имеют самый большой совокупный баланс на открытых счетах. Количество таких клиентов можно ограничить 
в зависимости от нижней планки, которую устанавливает банк, либо процентно. В данном запросе пришлось поизвращаться, чтобы в MySQL(моя субд) вернуть
 20 процентов самых ценных клиентов от всех клиентов. В Transact-SQL это делается проще.  */

SET @skip=0; SET @numrows=(select count(*) div 5 from account );
PREPARE STMT FROM 'SELECT client_id, SUM(amount) AS summa FROM account WHERE closed IS NULL GROUP BY client_id ORDER BY summa DESC LIMIT ?,?';
EXECUTE STMT USING @skip, @numrows;