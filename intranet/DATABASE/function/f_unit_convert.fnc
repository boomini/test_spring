--
-- F_UNIT_CONVERT  (Function) 
--
CREATE OR REPLACE FUNCTION F_UNIT_CONVERT (
    P_GUBUN VARCHAR2,
    P_VALUE VARCHAR2
    )
       RETURN NUMBER
IS
V_VALUE NUMBER;
BEGIN

--P_GUBUN 
-- 1 : m3 - > L
-- 2 : L -> m3

    CASE 
       WHEN P_GUBUN ='1' THEN
       SELECT P_VALUE*1000 INTO V_VALUE FROM DUAL;
       ELSE
       SELECT ROUND(P_VALUE/1000,8) INTO V_VALUE FROM DUAL;
    END CASE;    

 RETURN V_VALUE;
 
END;
/