-- automatic ROLLBACK executed because of unmet constraints
-- run as is and check the bank_accounts table; what happened?
-- run inside the transaction block; what happened?
-- run from lotr=# like so \i sample02.sql


BEGIN;

    UPDATE bank_accounts
    SET balance = balance + 45
    WHERE id = 3;
    -- Lord Sauron's account

    UPDATE bank_accounts
    SET balance = balance - 45
    WHERE id = 2;
    -- Bilbo B's account

    COMMIT;
END;