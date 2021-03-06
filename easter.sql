delimiter $$

CREATE FUNCTION `easter_f`(X INTEGER) RETURNS date
BEGIN
	DECLARE K,M,S,A,D,R,OG,SZ,OE,OS INT;
	DECLARE EASTERDATE DATE;
	SET K = X DIV 100;
	SET M = 15 + (3*K + 3) DIV 4 - (8*K + 13) DIV 25;
	SET S = 2 - (3*K + 3) DIV 4;
	SET A = X MOD 19;
	SET D = (19*A + M) MOD 30;
	SET R = (D + A DIV 11) DIV 29;
	SET OG = 21 + D - R ;
	SET SZ = 7 - (X + X DIV 4 + S) MOD 7;
	SET OE = 7 - (OG - SZ) MOD 7;
	SET OS = OG + OE;
	SET EASTERDATE = date_add(concat(X, '-03-01'), INTERVAL OS-1 DAY);
RETURN EASTERDATE;
END$$

