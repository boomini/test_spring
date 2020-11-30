--
-- SP_DIARY_WSTR_DML05  (Procedure) 
--
CREATE OR REPLACE PROCEDURE         SP_DIARY_WSTR_DML05
/**
폐기물처리  재계산
**/
(
    p_bplc_no    VARCHAR2,  /*사업장번호*/
    p_oper_de_s  VARCHAR2,  /*운영시작일자(YYYY-MM-DD)*/
    p_oper_de_e  VARCHAR2,  /*운영종료일자(YYYY-MM-DD)*/
    p_wste_no  VARCHAR2  /*폐기물명코드*/
)
IS
    v_rnum NUMBER := 1;
    v_cnt NUMBER;
    
BEGIN

    SELECT COUNT(1) INTO v_cnt
      FROM TB_DIARY_WSTE A
     WHERE A.BPLC_NO = p_bplc_no
       AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
       AND (NVL(p_wste_no,'@@') = '@@' OR A.WSTE_NO = p_wste_no) ;
    
    FOR REC IN (
                SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, WSTE_NO ORDER BY OPER_DE) RNUM, A.*
                  FROM TB_DIARY_WSTE A
                 WHERE A.BPLC_NO = p_bplc_no
                   AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
                   AND (NVL(p_wste_no,'@@') = '@@' OR A.WSTE_NO = p_wste_no)
                )

    LOOP 
    
        IF REC.RNUM <= v_cnt THEN
        
            UPDATE TB_DIARY_WSTE A
               SET (BFRT_BNT) = (
                                SELECT NVL(BB.BFRT_BNT,0)+NVL(BB.TODAY_OCCRRNC_QY,0)-NVL(BB.TODAY_PROCESS_QY,0)
                                  FROM (
                                        SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, WSTE_NO ORDER BY OPER_DE)+1 RNUM,
                                               A.*
                                          FROM TB_DIARY_WSTE A
                                       ) BB
                                 WHERE REC.RNUM = BB.RNUM
                                   AND REC.BPLC_NO = BB.BPLC_NO
                                   AND REC.WSTE_NO = BB.WSTE_NO
                                   AND REC.BPLC_NO = A.BPLC_NO
                                   AND REC.OPER_DE = A.OPER_DE
                                   AND REC.WSTE_NO = A.WSTE_NO
                               )
             WHERE EXISTS (
                           SELECT 'X','X'
                             FROM (
                                   SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, WSTE_NO ORDER BY OPER_DE)+1 RNUM,
                                          A.*
                                     FROM TB_DIARY_WSTE A
                                  ) BB
                             WHERE REC.RNUM = BB.RNUM
                               AND REC.BPLC_NO = BB.BPLC_NO
                               AND REC.WSTE_NO = BB.WSTE_NO
                               AND REC.BPLC_NO = A.BPLC_NO
                               AND REC.OPER_DE = A.OPER_DE
                               AND REC.WSTE_NO = A.WSTE_NO                          
                          )
            ;

        
        END IF;
             
    END LOOP;
    
    COMMIT;

END;
/
