-- run as is and then check the lotr.persons table. were the records inserted?
-- move the insert statements outside of a transaction block and run. 
-- run from lotr=# like so \i sample01.sql

BEGIN;
   INSERT INTO persons
    VALUES
        (10, 'Gandalf', 'White', 12312312, 'Sindarin', 'Neutral
    Good');

    INSERT INTO persons
    VALUES
        (10, 'Gimli', 'The Elf', 262, 'Westron', 'Chaotic Good');

    COMMIT;
END;