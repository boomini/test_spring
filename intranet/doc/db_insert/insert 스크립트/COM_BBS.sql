﻿SET DEFINE OFF;
Insert into COM_BBS
   (BBS_NO, BBS_NM, BBS_DC, BBS_TY, UPLOAD_POSBL_AT, UPLOAD_LMTT_CO, UPLOAD_POSBL_SIZE, WBDETR_USE_AT, SCRSNT_USE_AT, NTCSNT_USE_AT, ANSWER_USE_AT, USE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (1, '공지사항', '공지사항', 'C', 'Y', 
    3, 100, 'Y', 'N', 'Y', 
    'N', 'Y', TO_DATE('09/18/2018 11:35:23', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', 
    TO_DATE('09/18/2018 11:35:23', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_BBS
   (BBS_NO, BBS_NM, BBS_DC, BBS_TY, UPLOAD_POSBL_AT, UPLOAD_LMTT_CO, UPLOAD_POSBL_SIZE, WBDETR_USE_AT, SCRSNT_USE_AT, NTCSNT_USE_AT, ANSWER_USE_AT, USE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (2, '메뉴얼 게시판', '메뉴얼 게시판', 'C', 'Y', 
    1, 100, 'Y', 'N', 'N', 
    'N', 'Y', TO_DATE('09/18/2018 11:35:56', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', 
    TO_DATE('09/18/2018 11:35:56', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_BBS
   (BBS_NO, BBS_NM, BBS_DC, BBS_TY, UPLOAD_POSBL_AT, UPLOAD_LMTT_CO, UPLOAD_POSBL_SIZE, WBDETR_USE_AT, SCRSNT_USE_AT, NTCSNT_USE_AT, ANSWER_USE_AT, USE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (3, '엑셀업로드 파일관리', '엑셀업로드 파일관리', 'C', 'Y', 
    1, 100, 'Y', 'N', 'N', 
    'N', 'Y', TO_DATE('09/18/2018 11:36:35', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', 
    TO_DATE('09/18/2018 11:36:35', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_BBS
   (BBS_NO, BBS_NM, BBS_DC, BBS_TY, UPLOAD_POSBL_AT, WBDETR_USE_AT, SCRSNT_USE_AT, NTCSNT_USE_AT, ANSWER_USE_AT, USE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (4, 'test', 'test', 'C', 'N', 
    'N', 'N', 'N', 
    'N', 'Y', TO_DATE('01/24/2019 14:01:14', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('01/24/2019 14:01:14', 'MM/DD/YYYY HH24:MI:SS'), 'admin');
COMMIT;
