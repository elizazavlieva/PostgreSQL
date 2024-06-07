CREATE OR REPLACE PROCEDURE sp_withdraw_money(
	account_id INT,
	money_amount NUMERIC(19,4)
) 
AS
$$

BEGIN
	IF (SELECT balance FROM accounts WHERE account_id = id) < money_amount THEN
	RAISE NOTICE 'Insufficient balance to withdraw %', money_amount;
	
	ELSE
	UPDATE accounts
		SET balance = balance - money_amount
	WHERE account_id = id;
	END IF;
END;
$$

LANGUAGE plpgsql;