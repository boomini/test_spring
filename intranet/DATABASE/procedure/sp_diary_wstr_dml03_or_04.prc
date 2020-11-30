--
-- SP_DIARY_WSTR_DML03_OR_04  (Procedure) 
--
CREATE OR REPLACE PROCEDURE         SP_DIARY_WSTR_DML03_OR_04
/**
�������� ��뷮, ���� ��뷮  ����
**/
(
    p_bplc_no    VARCHAR2,  /*������ȣ*/
    p_oper_de_s  VARCHAR2,  /*���������(YYYY-MM-DD)*/
    p_oper_de_e  VARCHAR2,  /*���������(YYYY-MM-DD)*/
    p_use_se  VARCHAR2,  /*����*/
    p_code  VARCHAR2  /*����.���� �ڵ�*/
)
IS
    v_rnum NUMBER := 1;
    v_cnt NUMBER;
    
BEGIN

    SELECT COUNT(1) INTO v_cnt
      FROM TB_DIARY_GAS A
     WHERE A.BPLC_NO = p_bplc_no
       AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
       AND (NVL(p_code,'@@') = '@@' OR A.CODE = p_code)
       AND A.USE_SE = p_use_se  ;
    
    FOR REC IN (
                SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, CODE ORDER BY OPER_DE) RNUM, A.*
                  FROM TB_DIARY_GAS A
                 WHERE A.BPLC_NO = p_bplc_no
                   AND A.OPER_DE BETWEEN p_oper_de_s AND p_oper_de_e
                   AND (NVL(p_code,'@@') = '@@' OR A.CODE = p_code)
                   AND A.USE_SE = p_use_se
                )

    LOOP 
    
        IF REC.RNUM <= v_cnt THEN
        
            UPDATE TB_DIARY_GAS A
               SET (BFRT_MTINSP,TODAY_USE_QY) = (
                                SELECT BB.TODAY_MTINSP, NVL(REC.TODAY_MTINSP,0)-NVL(BB.TODAY_MTINSP,0)
                                  FROM (
                                        SELECT ROW_NUMBER() OVER (PARTITION BY BPLC_NO, CODE ORDER BY OPER_DE)+1 RNUM,
                                               A.*
                                          FROM TB_DIARY_GAS A
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
                                     FROM TB_DIARY_GAS A
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
