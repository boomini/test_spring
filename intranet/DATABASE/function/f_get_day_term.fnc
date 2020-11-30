--
-- F_GET_DAY_TERM  (Function) 
--
CREATE OR REPLACE FUNCTION         F_GET_DAY_TERM (
    S_DAY VARCHAR2,
    E_DAY VARCHAR2
    )
       RETURN VARCHAR2
IS
RETURN_VAL VARCHAR2(100);
BEGIN
    
SELECT 

--DECODE( NVL(TO_NUMBER (SUBSTR (diff, 2, 9)),0),0,'', TO_NUMBER (SUBSTR (diff, 2, 9))||'¿œ ')||
--DECODE(diff, '','-',SUBSTR (diff, 12, 2)||':'||SUBSTR (diff, 15, 2))
LPAD(DECODE( NVL(TO_NUMBER (SUBSTR (diff, 2, 9)),0),0,0, TO_NUMBER (SUBSTR (diff, 2, 9)))*24+SUBSTR (diff, 12, 2),length((DECODE( NVL(TO_NUMBER (SUBSTR (diff, 2, 9)),0),0,0, TO_NUMBER (SUBSTR (diff, 2, 9)))*24)),0)||':'||SUBSTR (diff, 15, 2)
 INTO RETURN_VAL
  FROM (SELECT NUMTODSINTERVAL (
                  TO_DATE (time2, 'YYYYMMDDHH24MISS')
                  - TO_DATE (time1, 'YYYYMMDDHH24MISS'),
                  'DAY')
                  diff
          FROM (SELECT S_DAY time1, E_DAY time2
                  FROM DUAL
                 ));

 RETURN RETURN_VAL;
 EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN ' ';

END;
/
