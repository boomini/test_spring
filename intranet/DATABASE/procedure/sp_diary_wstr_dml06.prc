--
-- SP_DIARY_WSTR_DML06  (Procedure) 
--
CREATE OR REPLACE PROCEDURE         SP_DIARY_WSTR_DML06
/**
용수사용  재계산
**/
(
    p_bplc_no    VARCHAR2,  /*사업장번호*/
    p_oper_de_s  VARCHAR2,  /*운영시작일자(YYYY-MM-DD)*/
    p_oper_de_e  VARCHAR2  /*운영종료일자(YYYY-MM-DD)*/
)
IS
    v_rnum NUMBER := 1;
    v_cnt NUMBER;
    
BEGIN

    SELECT COUNT(1) INTO v_cnt
      FROM TB_DIARY_USWTR_STTUS A
     WHERE A.BPLC_NO = p_bplc_no
       AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e;
    
    FOR REC IN (
                SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO ORDER BY OPER_DE) RNUM, A.*
                  FROM TB_DIARY_USWTR_STTUS A
                 WHERE A.BPLC_NO = p_bplc_no
                   AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
                )

    LOOP 
    
        IF REC.RNUM <= v_cnt THEN
        
            UPDATE TB_DIARY_USWTR_STTUS A
               SET (BFRT_BNT) = (
                                SELECT NVL(BB.BFRT_BNT,0)+NVL(BB.TODAY_OCCRRNC_QY,0)-NVL(BB.TODAY_PROCESS_QY,0)
                                  FROM (
                                        SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO ORDER BY OPER_DE)+1 RNUM,
                                               A.*
                                          FROM TB_DIARY_USWTR_STTUS A
                                       ) BB
                                 WHERE REC.RNUM = BB.RNUM
                                   AND REC.BPLC_NO = BB.BPLC_NO
                                   AND REC.BPLC_NO = A.BPLC_NO
                                   AND REC.OPER_DE = A.OPER_DE
                               )
             WHERE EXISTS (
                           SELECT 'X','X'
                             FROM (
                                   SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO ORDER BY OPER_DE)+1 RNUM,
                                          A.*
                                     FROM TB_DIARY_USWTR_STTUS A
                                  ) BB
                             WHERE REC.RNUM = BB.RNUM
                               AND REC.BPLC_NO = BB.BPLC_NO
                               AND REC.BPLC_NO = A.BPLC_NO
                               AND REC.OPER_DE = A.OPER_DE
                          )
            ;

        
        END IF;
             
    END LOOP;
    
    COMMIT;

END;
/
