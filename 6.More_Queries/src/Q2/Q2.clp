
CREATE PROCEDURE UpdateRating(IN pID int, IN avgCost int) 
LANGUAGE SQL 
BEGIN 
DECLARE v_averageMemberCost int; 
DECLARE v_providerID int; 
DECLARE at_end INT DEFAULT 0; 
DECLARE not_found CONDITION FOR SQLSTATE'02000'; 

DECLARE C1 CURSOR FOR 
SELECT providerID, averageMemberCost FROM provider WHERE providerID = pID; 
DECLARE CONTINUE HANDLER FOR not_found SET at_end = 1; 
OPEN C1; 
FETCH C1 INTO v_providerID, v_averageMemberCost; 
WHILE at_end = 0 DO 
	IF (v_averageMemberCost < avgCost) 
		THEN UPDATE providerRating set rating = rating + 1 WHERE providerID = v_providerID; 
	END IF;
	FETCH C1 INTO v_providerID, v_averageMemberCost; 
END WHILE; 
CLOSE C1; 
END
@
