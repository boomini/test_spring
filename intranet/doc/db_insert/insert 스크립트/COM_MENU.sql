SET DEFINE OFF;
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, TOPMENU_USE_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (221, '소개', '소개', '1', 1, 
    '소개', 1, 0, 
    'H', 'N', 'Y', 'Y', 
    'N', TO_DATE('01/24/2019 18:10:07', 'MM/DD/YYYY HH24:MI:SS'), 'admin', 'admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (222, 'はじめまして。', 'Nice to meet you', '1', 2, 
    '처음뵙겠습니다.', 9999, 221, 
    'H', 'N', 'Y', 'N', TO_DATE('01/28/2019 17:46:18', 'MM/DD/YYYY HH24:MI:SS'), 'admin', 'admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, TOPMENU_USE_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (195, '정보마당', '정보마당', '1', 1, 
    '정보마당', 2, 0, 
    'D', 'N', 'Y', 'Y', 
    'N', TO_DATE('08/27/2018 14:39:19', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 14:39:54', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, BBS_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (196, '공지사항', '공지사항', '1', 2, 
    '공지사항', 1, 195, 1, 
    'B', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:40:18', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('09/18/2018 11:37:06', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, BBS_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (197, '메뉴얼 게시판', '메뉴얼 게시판', '1', 2, 
    '메뉴얼 게시판', 1, 195, 2, 
    'B', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:40:34', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('09/18/2018 11:37:16', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, TOPMENU_USE_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (198, '관리자 모드', '관리자 모드', '1', 1, 
    '관리자 모드', 20, 0, 
    'D', 'N', 'Y', 'Y', 
    'N', TO_DATE('08/27/2018 14:40:50', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (199, '회원관리', '회원관리', '1', 2, 
    '회원관리', 1, 198, 
    'L', '/cms/member', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:41:07', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 14:49:41', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (200, '메뉴관리', '메뉴관리', '1', 2, 
    '메뉴관리', 1, 198, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:41:21', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (201, '메뉴관리', '메뉴관리', '1', 3, 
    '메뉴관리', 1, 200, 
    'L', '/cms/menu', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:41:31', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 15:00:21', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (203, '메뉴별 권한관리', '메뉴별 권한관리', '1', 3, 
    '메뉴별 권한관리', 1, 200, 
    'L', '/cms/menuAuth', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:41:43', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 14:49:56', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (204, '사이트관리', '사이트관리', '1', 2, 
    '사이트관리', 1, 198, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:41:57', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (205, '코드관리', '코드관리', '1', 3, 
    '코드관리', 1, 204, 
    'L', '/cms/code', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:42:10', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 14:50:06', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (206, '팝업관리', '팝업관리', '1', 3, 
    '팝업관리', 1, 204, 
    'L', '/cms/popup', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:42:21', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 14:50:23', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (207, '게시판관리', '게시판관리', '1', 3, 
    '게시판관리', 1, 204, 
    'L', '/cms/boardCfg', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:42:35', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 14:50:35', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (208, '배너관리', '배너관리', '1', 3, 
    '배너관리', 1, 204, 
    'L', '/cms/banner', 'N', 'N', 
    'N', TO_DATE('08/27/2018 14:42:43', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('11/12/2018 17:11:40', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (209, 'IP접근관리', 'IP접근관리', '1', 3, 
    'IP접근관리', 1, 204, 
    'L', '/cms/useIpMn', 'N', 'N', 
    'N', TO_DATE('08/27/2018 14:42:52', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('11/07/2018 15:19:41', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (210, '접속 관리', '접속 관리', '1', 2, 
    '접속 관리', 1, 198, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:43:11', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (211, '접속로그', '접속로그', '1', 3, 
    '접속로그', 1, 210, 
    'L', '/cms/accesLog', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:43:18', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 14:51:25', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (212, '접속통계', '접속통계', '1', 3, 
    '접속통계', 1, 210, 
    'L', '/cms/accessStat', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:43:26', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 14:51:38', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (213, '메뉴접속관리', '메뉴접속관리', '1', 2, 
    '메뉴접속관리', 1, 198, 
    'D', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:43:34', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 15:06:54', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (214, '메뉴접속 로그', '메뉴접속 로그', '1', 3, 
    '메뉴접속 로그', 1, 213, 
    'L', '/cms/accessMenuLog', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:43:43', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 14:52:31', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (215, '메뉴접속 통계', '메뉴접속 통계', '1', 3, 
    '메뉴접속 통계', 1, 213, 
    'L', '/cms/menuStat', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:43:51', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 14:52:47', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (216, '에러관리', '에러관리', '1', 2, 
    '에러관리', 1, 198, 
    'L', '/cms/errorLog', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:44:02', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', TO_DATE('08/27/2018 14:53:06', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (217, '서비스관리', '서비스관리', '1', 2, 
    '서비스관리', 1, 198, 
    'D', 'N', 'Y', 'Y', TO_DATE('08/27/2018 14:44:12', 'MM/DD/YYYY HH24:MI:SS'), 'sgis_admin', 'sgis_admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, TOPMENU_USE_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (218, '자료실', '자료실', '2', 1, 
    '자료실', 9999, 0, 
    'D', 'N', 'Y', 'Y', 
    'Y', TO_DATE('01/24/2019 14:00:04', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('01/24/2019 14:02:46', 'MM/DD/YYYY HH24:MI:SS'), 'admin');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, TOPMENU_USE_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (219, '정보마당1', '정보마당1', '2', 1, 
    '정보마당1', 9999, 0, 
    'D', 'N', 'Y', 'Y', 
    'Y', TO_DATE('01/24/2019 14:00:04', 'MM/DD/YYYY HH24:MI:SS'), 'admin', TO_DATE('01/24/2019 14:00:21', 'MM/DD/YYYY HH24:MI:SS'), 'admin');
COMMIT;
