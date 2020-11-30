--
-- SP_DIARY_WSTR_DML02  (Procedure) 
--
CREATE OR REPLACE PROCEDURE         SP_DIARY_WSTR_DML02
/**
약품 및 연료 사용량 재계산
**/
(
    p_bplc_no    VARCHAR2,  /*사업장번호*/
    p_oper_de_s  VARCHAR2,  /*운영시작일자(YYYY-MM-DD)*/
    p_oper_de_e  VARCHAR2,  /*운영종료일자(YYYY-MM-DD)*/
    p_use_se  VARCHAR2,  /*구분*/
    p_code  VARCHAR2  /*약품/연료명 코드*/
)
IS
    v_rnum NUMBER := 1;
    v_cnt NUMBER;
    
BEGIN

    UPDATE TB_DIARY_FUEL A
       SET A.INVNTRY_QY =   (SELECT NVL(BFRT_BNT,0)+NVL(TODAY_WRHOUSNG_QY,0)-NVL(TODAY_USE_QY,0)
                              FROM (
                                    SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, CODE ORDER BY OPER_DE) RNUM, A.*
                                      FROM TB_DIARY_FUEL A 
                                     WHERE A.BPLC_NO = p_bplc_no
                                       AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
                                       AND (NVL(p_code,'@@') = '@@' OR A.CODE = p_code)
                                       AND A.USE_SE = p_use_se
                                   ) B
                             WHERE RNUM = 1
                               AND A.BPLC_NO = B.BPLC_NO
                               AND A.OPER_DE = B.OPER_DE
                               AND A.CODE = B.CODE
                               AND A.USE_SE = B.USE_SE
                            )
     WHERE EXISTS (SELECT 'X'
                      FROM (
                            SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, CODE ORDER BY OPER_DE) RNUM, A.*
                              FROM TB_DIARY_FUEL A 
                             WHERE A.BPLC_NO = p_bplc_no
                               AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
                               AND (NVL(p_code,'@@') = '@@' OR A.CODE = p_code) 
                               AND A.USE_SE = p_use_se
                           ) B
                     WHERE RNUM = 1
                       AND A.BPLC_NO = B.BPLC_NO
                       AND A.OPER_DE = B.OPER_DE
                       AND A.CODE = B.CODE
                       AND A.USE_SE = B.USE_SE
                   )
    ;

    SELECT COUNT(1) INTO v_cnt
      FROM TB_DIARY_FUEL A
     WHERE A.BPLC_NO = p_bplc_no
       AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
       AND (NVL(p_code,'@@') = '@@' OR A.CODE = p_code)
       AND A.USE_SE = p_use_se  ;
    
    FOR REC IN (
                SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, CODE ORDER BY OPER_DE) RNUM, A.*
                  FROM TB_DIARY_FUEL A
                 WHERE A.BPLC_NO = p_bplc_no
                   AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
                   AND (NVL(p_code,'@@') = '@@' OR A.CODE = p_code)
                   AND A.USE_SE = p_use_se
                )

    LOOP 
    
        IF REC.RNUM <= v_cnt THEN
        
            UPDATE TB_DIARY_FUEL A
               SET (BFRT_BNT,INVNTRY_QY) = (
                                SELECT BB.INVNTRY_QY, NVL(BB.INVNTRY_QY,0)+NVL(REC.TODAY_WRHOUSNG_QY,0)-NVL(REC.TODAY_USE_QY,0)
                                  FROM (
                                        SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, CODE ORDER BY OPER_DE)+1 RNUM,
                                               A.*
                                          FROM TB_DIARY_FUEL A
                                       ) BB
                                 WHERE REC.RNUM = BB.RNUM
                                   AND REC.BPLC_NO = BB.BPLC_NO
                                   AND REC.CODE = BB.CODE
                                   AND REC.USE_SE = BB.USE_SE
                                   AND REC.BPLC_NO = A.BPLC_NO
                                   AND REC.OPER_DE = A.OPER_DE
                                   AND REC.CODE = A.CODE
                                   AND REC.USE_SE = A.USE_SE
                               )
             WHERE EXISTS (
                           SELECT 'X','X'
                             FROM (
                                   SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, CODE ORDER BY OPER_DE)+1 RNUM,
                                          A.*
                                     FROM TB_DIARY_FUEL A
                                  ) BB
                             WHERE REC.RNUM = BB.RNUM
                               AND REC.BPLC_NO = BB.BPLC_NO
                               AND REC.CODE = BB.CODE
                               AND REC.USE_SE = BB.USE_SE
                               AND REC.BPLC_NO = A.BPLC_NO
                               AND REC.OPER_DE = A.OPER_DE
                               AND REC.CODE = A.CODE     
                               AND REC.USE_SE = A.USE_SE                     
                          )
            ;

        
        END IF;
             
    END LOOP;
    
    COMMIT;

END;
/
