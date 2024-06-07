CREATE OR REPLACE PROCEDURE sp_transfer_money (
	sender_id INT,
	receiver_id INT,
	amount NUMERIC
)
AS
$$
	DECLARE
		curr_amount NUMERIC;
BEGIN
	CALL sp_withdraw_money(sender_id, amount);
	CALL sp_deposit_money(receiver_id, amount);

	SELECT INTO curr_amount
		balance
	FROM accounts
	WHERE id = sender_id;

	IF curr_amount < 0 THEN
		ROLLBACK;
	END IF;
END;
$$
LANGUAGE plpgsql;

