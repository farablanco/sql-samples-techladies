-- it's raining $$$

BEGIN;
	UPDATE bank_accounts
    SET balance = balance + 1000
    WHERE id = 2; -- Bilbo's account
	
SAVEPOINT BilboSave;
 
	UPDATE bank_accounts
    SET balance = balance + 1000
    WHERE id = 3; -- Lord Sauron's account

	
ROLLBACK TO BilboSave; -- at this point we realize that Sauron is up to no good
COMMIT;