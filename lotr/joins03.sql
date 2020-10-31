-- select all persons without a bank account

SELECT *
FROM persons p
LEFT JOIN bank_accounts b
ON p.id = b.persons_id
WHERE b.persons_id IS NULL