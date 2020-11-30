--
-- SP_DIARY_WSTR_DML01  (Procedure) 
--
CREATE OR REPLACE PROCEDURE         SP_DIARY_WSTR_DML01
/**
폐수처리현황 재계산
**/
(
    p_bplc_no    VARCHAR2,  /*사업장번호*/
    p_oper_de_s  VARCHAR2,  /*운영시작일자(YYYY-MM-DD)*/
    p_oper_de_e  VARCHAR2,  /*운영종료일자(YYYY-MM-DD)*/
    p_wstr_knd_code  VARCHAR2  /*폐수종류코드*/
)
IS
    v_rnum NUMBER := 1;
    v_cnt NUMBER;
    
BEGIN

    UPDATE TB_DIARY_WSTR A
       SET A.TODAY_BNT =   (SELECT NVL(BFRT_BNT,0)+NVL(TODAY_TRUST_QY,0)-NVL(TODAY_PROCESS_QY,0)-NVL(TODAY_REUSE_QY,0)
                              FROM (
                                    SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, WSTR_KND_CODE ORDER BY OPER_DE) RNUM, A.*
                                      FROM TB_DIARY_WSTR A 
                                     WHERE A.BPLC_NO = p_bplc_no
                                       AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
                                       AND (NVL(p_wstr_knd_code,'@@') = '@@' OR A.WSTR_KND_CODE = p_wstr_knd_code)
                                   ) B
                             WHERE RNUM = 1
                               AND A.BPLC_NO = B.BPLC_NO
                               AND A.OPER_DE = B.OPER_DE
                               AND A.WSTR_KND_CODE = B.WSTR_KND_CODE
                            )
     WHERE EXISTS (SELECT 'X'
                      FROM (
                            SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, WSTR_KND_CODE ORDER BY OPER_DE) RNUM, A.*
                              FROM TB_DIARY_WSTR A 
                             WHERE A.BPLC_NO = p_bplc_no
                               AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
                               AND (NVL(p_wstr_knd_code,'@@') = '@@' OR A.WSTR_KND_CODE = p_wstr_knd_code) 
                           ) B
                     WHERE RNUM = 1
                       AND A.BPLC_NO = B.BPLC_NO
                       AND A.OPER_DE = B.OPER_DE
                       AND A.WSTR_KND_CODE = B.WSTR_KND_CODE
                   )
    ;

    SELECT COUNT(1) INTO v_cnt
      FROM TB_DIARY_WSTR A
     WHERE A.BPLC_NO = p_bplc_no
       AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
       AND (NVL(p_wstr_knd_code,'@@') = '@@' OR A.WSTR_KND_CODE = p_wstr_knd_code) ;
    
    FOR REC IN (
                SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, WSTR_KND_CODE ORDER BY OPER_DE) RNUM, A.*
                  FROM TB_DIARY_WSTR A
                 WHERE A.BPLC_NO = p_bplc_no
                   AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
                   AND (NVL(p_wstr_knd_code,'@@') = '@@' OR A.WSTR_KND_CODE = p_wstr_knd_code)
                )

    LOOP 
    
        IF REC.RNUM <= v_cnt THEN
        
            UPDATE TB_DIARY_WSTR A
               SET (BFRT_BNT,TODAY_BNT) = (
                                SELECT BB.TODAY_BNT, NVL(BB.TODAY_BNT,0)+NVL(REC.TODAY_TRUST_QY,0)-NVL(REC.TODAY_PROCESS_QY,0)-NVL(REC.TODAY_REUSE_QY,0) 
                                  FROM (
                                        SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, WSTR_KND_CODE ORDER BY OPER_DE)+1 RNUM,
                                               A.*
                                          FROM TB_DIARY_WSTR A
                                       ) BB
                                 WHERE REC.RNUM = BB.RNUM
                                   AND REC.BPLC_NO = BB.BPLC_NO
                                   AND REC.WSTR_KND_CODE = BB.WSTR_KND_CODE
                                   AND REC.BPLC_NO = A.BPLC_NO
                                   AND REC.OPER_DE = A.OPER_DE
                                   AND REC.WSTR_KND_CODE = A.WSTR_KND_CODE
                               )
             WHERE EXISTS (
                           SELECT 'X','X'
                             FROM (
                                   SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, WSTR_KND_CODE ORDER BY OPER_DE)+1 RNUM,
                                          A.*
                                     FROM TB_DIARY_WSTR A
                                  ) BB
                             WHERE REC.RNUM = BB.RNUM
                               AND REC.BPLC_NO = BB.BPLC_NO
                               AND REC.WSTR_KND_CODE = BB.WSTR_KND_CODE
                               AND REC.BPLC_NO = A.BPLC_NO
                               AND REC.OPER_DE = A.OPER_DE
                               AND REC.WSTR_KND_CODE = A.WSTR_KND_CODE                          
                          )
            ;

        
        END IF;
             
    END LOOP;
    
    COMMIT;

END;
/
