-- select all persons with bank accounts and show bank account details

SELECT p.id, p.first_name, p.last_name, b.account_name, b.balance 
FROM persons p
JOIN bank_accounts b
ON p.id = b.persons_id