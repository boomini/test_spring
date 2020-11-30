SET DEFINE OFF;
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (147, '토양측정망', '토양측정망', '1', 2, 
    '토양측정망', 1, 125, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:11:41', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (148, '토양측정망 관리', '토양측정망 관리', '1', 3, 
    '토양측정망 관리', 1, 147, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:12:07', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (149, '지점조회', '지점조회', '1', 4, 
    '지점조회', 1, 148, 
    'L', '/cms/soilMeasurementMn/soilMeasurementSpotList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:12:20', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:49:00', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (150, '신규등록', '신규등록', '1', 4, 
    '신규등록', 1, 148, 
    'L', '/cms/soilMeasurementMn/soilMeasurementMnReg', 'N', 'Y', 
    'Y', TO_DATE('08/27/2018 14:12:34', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 16:58:18', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (151, '이력관리', '이력관리', '1', 4, 
    '이력관리', 1, 148, 
    'L', '/cms/soilMeasurementMn/soilMeasurementMnHisList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:12:49', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:49:45', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (152, '토양측정망 자료입력', '토양측정망 자료입력', '1', 3, 
    '토양측정망 자료입력', 1, 147, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:13:07', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (153, '토양측정망 입력현황', '토양측정망 입력현황', '1', 4, 
    '토양측정망 입력현황', 1, 152, 
    'L', '/cms/soilMeasurementInput/soilMeasurementInputState', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:24:59', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:51:27', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (154, '토양측정망 입력현황조회', '토양측정망 입력현황조회', '1', 4, 
    '토양측정망 입력현황조회', 1, 152, 
    'L', '/cms/soilMeasurementInput/soilMeasurementInputCheck', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:25:18', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:51:44', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (155, '자료확정', '자료확정', '1', 4, 
    '자료확정', 1, 152, 
    'L', '/cms/soilMeasurementInput/soilMeasurementDataFix', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:25:30', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:52:15', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (156, '토양측정망 개별입력', '토양측정망 개별입력', '1', 4, 
    '토양측정망 개별입력', 1, 152, 
    'L', '/cms/soilMeasurementInput/soilMeasurementIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:25:42', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:52:39', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (229, '골프장별 입력현황', '골프장별 입력현황', '1', 4, 
    '골프장별 입력현황', 1, 163, 
    'L', '/cms/golfPesticides/golfClubInputState', 'N', 'Y', 
    'Y', TO_DATE('08/28/2018 09:30:28', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (230, '시도별 입력현황', '시도별 입력현황', '1', 4, 
    '시도별 입력현황', 9999, 163, 
    'L', '/cms/golfPesticides/golfCityInputState', 'N', 'Y', 
    'Y', TO_DATE('08/29/2018 10:27:20', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (231, '지점조회', '지점조회', '1', 4, 
    '지점조회', 1, 185, 
    'L', '/cms/soilPoll/soilPollSpotList', 'N', 'Y', 
    'N', TO_DATE('09/03/2018 15:59:47', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/03/2018 16:24:39', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (232, '골프장별 입력현황', '골프장별 입력현황', '1', 4, 
    '골프장별 입력현황', 1, 163, 
    'L', '/cms/golfPesticides/golfClubInputState', 'N', 'Y', 
    'N', TO_DATE('09/03/2018 16:09:26', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (233, '시도별 입력현황', '시도별 입력현황', '1', 4, 
    '시도별 입력현황', 1, 163, 
    'L', '/cms/golfPesticides/golfCityInputState', 'N', 'Y', 
    'N', TO_DATE('09/03/2018 16:09:52', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (234, '먹는샘물관리', '먹는샘물관리', '1', 1, 
    '먹는샘물관리', 9999, 0, 
    'D', 'N', 'Y', 'Y', TO_DATE('09/11/2018 09:39:57', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (235, '먹는샘물관리', '먹는샘물관리', '1', 2, 
    '먹는샘물관리', 1, 125, 
    'D', 'N', 'Y', 'N', TO_DATE('09/11/2018 09:40:25', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (236, '먹는물공동시설관리', '먹는물공동시설관리', '1', 2, 
    '먹는물공동시설관리', 1, 125, 
    'D', 'N', 'Y', 'N', TO_DATE('09/11/2018 09:40:43', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (237, '정수기관리', '정수기관리', '1', 2, 
    '정수기관리', 1, 125, 
    'D', 'N', 'Y', 'N', TO_DATE('09/11/2018 09:41:01', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (238, '기타관리', '기타관리', '1', 2, 
    '기타관리', 1, 125, 
    'D', 'N', 'Y', 'N', TO_DATE('09/11/2018 09:41:22', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (239, '수질검사결과관리', '수질검사결과관리', '1', 3, 
    '수질검사결과관리', 1, 235, 
    'D', '/cms/drinkWaterMn/drinkWaterInputStateList', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 09:43:10', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:52:27', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (240, '자료입력', '자료입력', '1', 3, 
    '자료입력', 4, 235, 
    'D', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 09:43:26', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 09:40:19', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (241, '적합기준관리', '적합기준관리', '1', 3, 
    '적합기준관리', 3, 235, 
    'D', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 09:43:41', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 09:40:40', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (242, '유통업체', '유통업체', '1', 3, 
    '유통업체', 9999, 235, 
    'D', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 09:44:05', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/02/2018 17:56:15', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (243, '수질검사결과관리', '수질검사결과관리', '1', 4, 
    '수질검사결과관리', 9999, 239, 
    'D', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 09:44:46', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 09:41:49', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (244, '개방관리', '개방관리', '1', 4, 
    '개방관리', 9999, 239, 
    'D', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 09:45:11', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 09:37:19', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (245, '제조업체', '제조업체', '1', 4, 
    '제조업체', 1, 240, 
    'L', '/cms/drinkWater/input/manuList', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 09:45:54', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:22:54', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (246, '유통업체', '유통업체', '1', 4, 
    '유통업체', 1, 240, 
    'L', '/cms/drinkWater/input/distrList', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 09:46:10', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:23:12', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (247, '검사정보관리 파일등록', '검사정보관리 파일등록', '1', 4, 
    '검사정보관리 파일등록', 9999, 240, 
    'L', '/cms/manuFacturerMn/examInfoMnFileInsert', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 09:46:31', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/11/2018 10:51:18', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (248, '검사정보관리 수정이력', '검사정보관리 수정이력', '1', 4, 
    '검사정보관리 수정이력', 9999, 240, 
    'L', '/cms/manuFacturerMn/examInfoMnModHis', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 09:46:47', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/11/2018 10:51:55', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (249, '검사정보관리 삭제', '검사정보관리 삭제', '1', 4, 
    '검사정보관리 삭제', 9999, 240, 
    'L', '/cms/manuFacturerMn/examInfoMnDel', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 09:47:03', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/11/2018 10:52:11', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (250, '적합기준관리', '적합기준관리', '1', 4, 
    '적합기준관리', 1, 241, 
    'L', '/cms/drinkWater/standardList', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 09:47:31', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:23:47', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (251, '수입판매업 신규등록', '수입판매업 신규등록', '1', 4, 
    '수입판매업 신규등록', 9999, 241, 
    'L', '/cms/importSaleMn/importSaleReg', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 09:47:51', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/11/2018 11:31:24', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (252, '수입실적관리 파일등록', '수입실적관리 파일등록', '1', 4, 
    '수입실적관리 파일등록', 9999, 241, 
    'L', '/cms/importSaleMn/importRecordFileInsert', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 09:48:12', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/11/2018 11:31:52', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (253, '수입실적관리 수정이력', '수입실적관리 수정이력', '1', 4, 
    '수입실적관리 수정이력', 9999, 241, 
    'L', '/cms/importSaleMn/importRecordModHis', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 09:48:29', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/11/2018 11:32:42', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (254, '수입실적관리 삭제', '수입실적관리 삭제', '1', 4, 
    '수입실적관리 삭제', 9999, 241, 
    'L', '/cms/importSaleMn/importRecordDel', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 09:48:30', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/11/2018 11:33:05', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (255, '유통업체', '유통업체', '1', 4, 
    '유통업체', 9999, 242, 
    'L', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 09:49:15', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/02/2018 18:02:58', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (256, '유통전문판매업 신규등록', '유통전문판매업 신규등록', '1', 4, 
    '유통전문판매업 신규등록', 9999, 242, 
    'L', '/cms/distributionMn/distributionReg', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 09:49:29', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/11/2018 13:19:11', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (257, '검사정보관리', '검사정보관리', '1', 3, 
    '검사정보관리', 1, 236, 
    'D', 'N', 'Y', 'N', TO_DATE('09/11/2018 14:14:54', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (258, '지점정보관리', '지점정보관리', '1', 3, 
    '지점정보관리', 1, 236, 
    'D', 'N', 'Y', 'N', TO_DATE('09/11/2018 14:15:11', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (259, '파일등록', '파일등록', '1', 4, 
    '파일등록', 1, 257, 
    'L', '/cms/examInfoMn/examInfoMnFileInsert', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 14:15:28', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/11/2018 14:15:49', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (260, '수정이력', '수정이력', '1', 4, 
    '수정이력', 1, 257, 
    'L', '/cms/examInfoMn/examInfoMnModHis', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 14:16:13', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (261, '삭제', '삭제', '1', 4, 
    '삭제', 1, 257, 
    'L', '/cms/examInfoMn/examInfoMnDel', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 14:16:32', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (262, '입력현황', '입력현황', '1', 4, 
    '입력현황', 1, 258, 
    'L', '/cms/spotInfoMn/spotInfoMnInputState', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 14:16:56', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (263, '신규등록', '신규등록', '1', 4, 
    '신규등록', 9999, 258, 
    'L', '/cms/spotInfoMn/spotInfoMnReg', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 14:17:17', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/13/2018 10:25:16', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (264, '정수기', '정수기', '1', 3, 
    '정수기', 1, 237, 
    'D', 'N', 'Y', 'N', TO_DATE('09/11/2018 14:45:33', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (265, '정수성능검사관리', '정수성능검사관리', '1', 3, 
    '정수성능검사관리', 1, 237, 
    'D', 'N', 'Y', 'N', TO_DATE('09/11/2018 14:45:49', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (266, '입력현황', '입력현황', '1', 4, 
    '입력현황', 1, 264, 
    'L', '/cms/purifierMn/purifierMnInputStateList', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 14:46:16', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (267, '신규등록', '신규등록', '1', 4, 
    '신규등록', 9999, 264, 
    'L', '/cms/purifierMn/purifierMnReg', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 14:46:39', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (268, '파일등록', '파일등록', '1', 4, 
    '파일등록', 1, 265, 
    'L', '/cms/purifierEfficiencyMn/purifierEfficiencyMnFileInsert', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 14:47:07', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (269, '수정이력', '수정이력', '1', 4, 
    '수정이력', 1, 265, 
    'L', '/cms/purifierEfficiencyMn/purifierEfficiencyMnModHis', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 14:47:26', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/11/2018 15:14:36', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (270, '삭제', '삭제', '1', 4, 
    '삭제', 1, 265, 
    'L', '/cms/purifierEfficiencyMn/purifierEfficiencyMnDel', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 14:47:44', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (271, '냉온수기', '냉온수기', '1', 3, 
    '냉온수기', 1, 238, 
    'D', 'N', 'Y', 'N', TO_DATE('09/11/2018 15:30:22', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (272, '환경영향조사대행자', '환경영향조사대행자', '1', 3, 
    '환경영향조사대행자', 1, 238, 
    'D', 'N', 'Y', 'N', TO_DATE('09/11/2018 15:30:40', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (273, '입력현황', '입력현황', '1', 4, 
    '입력현황', 1, 271, 
    'L', '/cms/ColdHotWaterMn/coldHotWaterInputStateList', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 15:31:06', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/19/2018 13:08:49', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (274, '신규등록', '신규등록', '1', 4, 
    '신규등록', 9999, 271, 
    'L', '/cms/ColdHotWaterMn/coldHotWaterReg', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 15:31:24', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/19/2018 13:08:32', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (275, '입력현황', '입력현황', '1', 4, 
    '입력현황', 1, 272, 
    'L', '/cms/SurveyProxyMn/SurveyProxyInputStateList', 'N', 'Y', 
    'N', TO_DATE('09/11/2018 15:31:48', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/19/2018 11:35:46', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (276, '신규등록', '신규등록', '1', 4, 
    '신규등록', 9999, 272, 
    'L', '/cms/SurveyProxyMn/SurveyProxyReg', 'N', 'Y', 
    'Y', TO_DATE('09/11/2018 15:32:07', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('09/19/2018 11:36:04', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (277, '수입판매업체', '수입판매업체', '1', 3, 
    '수입판매업체', 9999, 235, 
    'D', 'N', 'Y', 'Y', TO_DATE('10/02/2018 17:56:33', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (278, '수입판매업체', '수입판매업체', '1', 4, 
    '수입판매업체', 9999, 277, 
    'D', 'N', 'Y', 'N', TO_DATE('10/02/2018 18:03:40', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (279, '수질검사결과 관리', '수질검사결과 관리', '1', 4, 
    '수질검사결과 관리', 9999, 239, 
    'D', 'N', 'Y', 'Y', TO_DATE('10/04/2018 09:36:41', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (280, '제조업체원수', '제조업체원수', '1', 5, 
    '제조업체원수', 9999, 243, 
    'L', 'N', 'Y', 'Y', TO_DATE('10/04/2018 09:37:55', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (281, '개방관리', '개방관리', '1', 4, 
    '개방관리', 9999, 239, 
    'D', 'N', 'Y', 'Y', TO_DATE('10/04/2018 09:42:04', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (282, '제조업체원수', '제조업체원수', '1', 5, 
    '제조업체원수', 9999, 243, 
    'L', '/cms/drinkWater/check/resultMn/manuList', 'N', 'Y', 
    'N', TO_DATE('10/04/2018 09:42:34', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:21:40', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (283, '유통제품수거', '유통제품수거', '1', 5, 
    '유통제품수거', 9999, 243, 
    'L', '/cms/drinkWater/check/resultMn/distrList', 'N', 'Y', 
    'N', TO_DATE('10/04/2018 09:42:53', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:22:07', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (284, '제조업체원수', '제조업체원수', '1', 5, 
    '제조업체원수', 9999, 281, 
    'L', '/cms/drinkWater/check/openMn/manuList', 'N', 'Y', 
    'N', TO_DATE('10/04/2018 09:43:36', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:22:19', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (285, '유통제품수거', '유통제품수거', '1', 5, 
    '유통제품수거', 9999, 281, 
    'L', '/cms/drinkWater/check/openMn/distList', 'N', 'Y', 
    'N', TO_DATE('10/04/2018 09:43:58', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:22:33', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (286, '수입판매업체', '수입판매업체', '1', 4, 
    '수입판매업체', 1, 240, 
    'L', '/cms/drinkWater/input/importList', 'N', 'Y', 
    'N', TO_DATE('10/04/2018 09:45:36', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:23:26', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (287, '제조업체원수', '제조업체원수', '1', 4, 
    '제조업체원수', 1, 239, 
    'L', '/cms/drinkWater/resultMn/manuList', 'N', 'Y', 
    'N', TO_DATE('10/04/2018 10:39:38', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:55:01', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (288, '유통제품수거', '유통제품수거', '1', 4, 
    '유통제품수거', 1, 239, 
    'L', '/cms/drinkWater/resultMn/distrList', 'N', 'Y', 
    'N', TO_DATE('10/04/2018 10:40:11', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:55:22', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (289, '제조업체원수', '제조업체원수', '1', 5, 
    '제조업체원수', 9999, 287, 
    'L', '/cms/drinkWater/resultMn/manuList', 'N', 'Y', 
    'Y', TO_DATE('10/04/2018 10:40:44', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:45:00', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (290, '유통제품수거', '유통제품수거', '1', 5, 
    '유통제품수거', 9999, 287, 
    'L', '/cms/drinkWater/resultMn/distrList', 'N', 'Y', 
    'Y', TO_DATE('10/04/2018 10:41:06', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:45:14', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (291, '제조업체원수', '제조업체원수', '1', 5, 
    '제조업체원수', 9999, 288, 
    'L', '/cms/drinkWater/openMn/manuList', 'N', 'Y', 
    'Y', TO_DATE('10/04/2018 10:41:26', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:45:34', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (292, '유통제품수거', '유통제품수거', '1', 5, 
    '유통제품수거', 9999, 288, 
    'L', '/cms/drinkWater/openMn/distList', 'N', 'Y', 
    'Y', TO_DATE('10/04/2018 10:41:47', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 10:45:48', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (293, '개방관리', '개방관리', '1', 3, 
    '개방관리', 2, 235, 
    'D', 'N', 'Y', 'N', TO_DATE('10/04/2018 10:53:36', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (294, '제조업체원수', '제조업체원수', '1', 4, 
    '제조업체원수', 1, 293, 
    'L', '/cms/drinkWater/openMn/manuList', 'N', 'Y', 
    'N', TO_DATE('10/04/2018 10:54:15', 'MM/DD/YYYY HH24:MI:SS'), 'ce', 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (295, '유통제품수거', '유통제품수거', '1', 4, 
    '유통제품수거', 1, 293, 
    'L', '/cms/drinkWater/openMn/distrList', 'N', 'Y', 
    'N', TO_DATE('10/04/2018 10:54:43', 'MM/DD/YYYY HH24:MI:SS'), 'ce', TO_DATE('10/04/2018 13:20:53', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (220, '지하수측정망-조사지점생성', '지하수측정망-조사지점생성', '1', 3, 
    '지하수측정망-조사지점생성', 1, 217, 
    'L', '/cms/waterSpotCr', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:44:42', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/04/2018 14:14:00', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (221, '토양측정망-조사지점생성', '토양측정망-조사지점생성', '1', 3, 
    '토양측정망-조사지점생성', 1, 217, 
    'L', '/cms/soilSpotCr', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:44:51', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/04/2018 16:36:16', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (222, '토양오염실태조사-조사지점생성', '토양오염실태조사-조사지점생성', '1', 3, 
    '토양오염실태조사-조사지점생성', 1, 217, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:45:04', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (223, '지하수측정망-수정', '지하수측정망-수정', '1', 3, 
    '지하수측정망-수정', 1, 217, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:45:16', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (224, '지하수측정망-추가', '지하수측정망-추가', '1', 3, 
    '지하수측정망-추가', 1, 217, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:45:28', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (225, '토양측정망-수정', '토양측정망-수정', '1', 3, 
    '토양측정망-수정', 1, 217, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:45:49', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (226, '골프장-농약관리', '골프장-농약관리', '1', 3, 
    '골프장-농약관리', 1, 217, 
    'L', '/cms/golfCropMn', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:46:05', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:53:56', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (227, '골프장/입력기간설정', '골프장/입력기간설정', '1', 3, 
    '골프장/입력기간설정', 1, 217, 
    'L', '/cms/golfInputTmMn', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:46:20', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('10/08/2018 15:05:27', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (189, '시도별 입력현황조회', '시도별 입력현황조회', '1', 4, 
    '시도별 입력현황조회', 1, 187, 
    'L', '/cms/soilPoll/soilPollCityInputStateInfo', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:37:48', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 16:01:07', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (193, '토양오염실태조사 입력현황조회', '토양오염실태조사 입력현황조회', '1', 4, 
    '토양오염실태조사 입력현황조회', 1, 187, 
    'L', '/cms/soilPoll/soilPollIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:38:31', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/04/2018 13:54:56', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, TOPMENU_USE_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (100, '통합검색', '통합검색', '1', 1, 
    '통합검색', 1, 0, 
    'D', 'N', 'Y', 'Y', 
    'N', TO_DATE('08/27/2018 11:32:45', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (103, '지역별통합검색', '지역별통합검색', '1', 4, 
    '지역별통합검색', 1, 102, 
    'L', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 11:34:50', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/14/2018 09:33:01', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (104, '측정망별전국검색', '측정망별전국검색', '1', 4, 
    '측정망별전국검색', 1, 102, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:35:00', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (105, '통계조회', '통계조회', '1', 2, 
    '통계조회', 1, 100, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:35:13', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (101, '통합검색', '통합검색', '1', 2, 
    '통합검색', 1, 100, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:34:24', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (102, '통계조회', '통계조회', '1', 3, 
    '통계조회', 1, 101, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:34:33', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (106, '골프장', '골프장', '1', 3, 
    '골프장', 1, 105, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:35:28', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, BBS_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (228, '엑셀 업로드 파일 관리', '엑셀 업로드 파일 관리', '1', 2, 
    '엑셀 업로드 파일 관리', 1, 195, 3, 
    'B', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 15:22:38', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/18/2018 11:37:26', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (107, '골프장농약사용량검사결과', '골프장농약사용량검사결과', '1', 4, 
    '골프장농약사용량검사결과', 1, 106, 
    'L', '/cms/golfSearch/golfUsedList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 11:36:30', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/27/2018 14:07:31', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (108, '골프장농약잔류량검사결과', '골프장농약잔류량검사결과', '1', 4, 
    '골프장농약잔류량검사결과', 1, 106, 
    'L', '/cms/golfSearch/golfResidueList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 11:36:40', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/27/2018 14:07:19', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (109, '골프장농약사용품목', '골프장농약사용품목', '1', 4, 
    '골프장농약사용품목', 1, 106, 
    'L', '/cms/golfSearch/golfPesticideList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 11:36:50', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/27/2018 15:31:03', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (110, '지하수수질측정망', '지하수수질측정망', '1', 3, 
    '지하수수질측정망', 1, 105, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:37:01', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (111, '측정지점조회', '측정지점조회', '1', 4, 
    '측정지점조회', 1, 110, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:37:13', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (112, '초과지점조회', '초과지점조회', '1', 4, 
    '초과지점조회', 1, 110, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:37:23', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (113, '중복초과지점조회', '중복초과지점조회', '1', 4, 
    '중복초과지점조회', 1, 110, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:37:36', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (114, '토양측정망', '토양측정망', '1', 3, 
    '토양측정망', 1, 105, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:37:59', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (115, '측정지점조회', '측정지점조회', '1', 4, 
    '측정지점조회', 1, 114, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:38:13', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (116, '초과지점조회', '초과지점조회', '1', 4, 
    '초과지점조회', 1, 114, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:38:25', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (117, '토양오염실태조사', '토양오염실태조사', '1', 3, 
    '토양오염실태조사', 1, 105, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:38:39', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (118, '측정지점조회', '측정지점조회', '1', 4, 
    '측정지점조회', 1, 117, 
    'L', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 11:38:50', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/14/2018 09:29:58', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (119, '초과지점조회', '초과지점조회', '1', 4, 
    '초과지점조회', 1, 117, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:39:00', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (120, '통계출력', '통계출력', '1', 2, 
    '통계출력', 1, 100, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:39:14', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (121, '골프장통계출력', '골프장통계출력', '1', 3, 
    '골프장통계출력', 1, 120, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:39:35', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (122, '지하수통계출력', '지하수통계출력', '1', 3, 
    '지하수통계출력', 1, 120, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:39:45', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (123, '토양오염실태조사통계출력', '토양오염실태조사통계출력', '1', 3, 
    '토양오염실태조사통계출력', 1, 120, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:40:00', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (124, '개별조회', '개별조회', '1', 2, 
    '개별조회', 1, 100, 
    'L', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:40:15', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, TOPMENU_USE_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (125, '자료입력', '자료입력', '1', 1, 
    '자료입력', 1, 0, 
    'D', 'N', 'Y', 'Y', 
    'N', TO_DATE('08/27/2018 11:40:57', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (126, '지하수측정망', '지하수측정망', '1', 2, 
    '지하수측정망', 1, 125, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:41:18', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (127, '지하수측정망관리', '지하수측정망관리', '1', 3, 
    '지하수측정망관리', 1, 126, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 11:41:29', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (128, '지점조회', '지점조회', '1', 4, 
    '지점조회', 1, 127, 
    'L', '/cms/underWaterMn/underWaterMnSpotList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 11:41:41', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:30:07', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (131, '신규등록', '신규등록', '1', 4, 
    '신규등록', 1, 127, 
    'L', '/cms/underWaterMn/underWaterMnReg', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:08:20', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 16:55:57', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (132, '이력관리', '이력관리', '1', 4, 
    '이력관리', 1, 127, 
    'L', '/cms/underWaterMn/underWaterMnHisList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:08:30', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:30:22', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (133, '지하수측정망자료입력', '지하수측정망자료입력', '1', 3, 
    '지하수측정망자료입력', 1, 126, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:08:55', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (134, '시군구 입력현황', '시군구 입력현황', '1', 4, 
    '시군구 입력현황', 1, 133, 
    'L', '/cms/underWaterInput/cityInputState', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:09:08', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:31:43', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (135, '오염우려지역 입력현황', '오염우려지역 입력현황', '1', 4, 
    '오염우려지역 입력현황', 1, 133, 
    'L', '/cms/underWaterInput/pollFearZoneInputState', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:09:17', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:32:07', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (136, '시군구입력현황조회', '시군구입력현황조회', '1', 4, 
    '시군구입력현황조회', 1, 133, 
    'L', '/cms/underWaterInput/cityIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:09:29', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:32:35', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (137, '오염우려지역 입력현황조회', '오염우려지역 입력현황조회', '1', 4, 
    '오염우려지역 입력현황조회', 1, 133, 
    'L', '/cms/underWaterInput/pollFearZoneIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:09:38', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:33:08', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (138, '농촌지하수 입력현황조회', '농촌지하수 입력현황조회', '1', 4, 
    '농촌지하수 입력현황조회', 1, 133, 
    'L', '/cms/underWaterInput/farmCityIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:09:48', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:33:34', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (139, '오염우려지역 자료확정', '오염우려지역 자료확정', '1', 4, 
    '오염우려지역 자료확정', 1, 133, 
    'L', '/cms/underWaterInput/pollFearZoneIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:09:59', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:33:57', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (140, '시군구 자료확정', '시군구 자료확정', '1', 4, 
    '시군구 자료확정', 1, 133, 
    'L', '/cms/underWaterInput/cityIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:10:08', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:44:44', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (141, '오염우려지역 개별입력', '오염우려지역 개별입력', '1', 4, 
    '오염우려지역 개별입력', 1, 133, 
    'L', '/cms/underWaterInput/pollFearZoneIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:10:19', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:45:24', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (142, '오염우려지역 일괄입력', '오염우려지역 일괄입력', '1', 4, 
    '오염우려지역 일괄입력', 1, 133, 
    'L', '/cms/underWaterInput/pollFearZoneBundleInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:10:29', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:46:26', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (143, '농촌지하수 개별입력', '농촌지하수 개별입력', '1', 4, 
    '농촌지하수 개별입력', 1, 133, 
    'L', '/cms/underWaterInput/farmCityIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:10:44', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 16:07:31', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (144, '농촌지하수 일괄입력', '농촌지하수 일괄입력', '1', 4, 
    '농촌지하수 일괄입력', 1, 133, 
    'L', '/cms/underWaterInput/farmCityBundleInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:10:58', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:47:12', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (145, '시군구 개별입력', '시군구 개별입력', '1', 4, 
    '시군구 개별입력', 1, 133, 
    'L', '/cms/underWaterInput/cityIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:11:08', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:47:35', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (146, '시군구 일괄입력', '시군구 일괄입력', '1', 4, 
    '시군구 일괄입력', 1, 133, 
    'L', '/cms/underWaterInput/cityBundleInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:11:20', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:47:47', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (157, '토양측정망 일괄입력', '토양측정망 일괄입력', '1', 4, 
    '토양측정망 일괄입력', 1, 152, 
    'L', '/cms/soilMeasurementInput/soilMeasurementBundleInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:25:57', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:53:10', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (158, '골프장 사용량 잔류량', '골프장 사용량 잔류량', '1', 2, 
    '골프장 사용량 잔류량', 1, 125, 
    'D', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:26:31', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:32:18', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (159, '골프장관리', '골프장관리', '1', 3, 
    '골프장관리', 1, 158, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:26:55', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (160, '지점조회', '지점조회', '1', 4, 
    '지점조회', 1, 159, 
    'L', '/cms/golfMn/golfMnSpotList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:27:10', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:54:08', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (161, '신규등록', '신규등록', '1', 4, 
    '신규등록', 1, 159, 
    'L', '/cms/golfMn/golfMnReg', 'N', 'Y', 
    'Y', TO_DATE('08/27/2018 14:27:22', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:54:48', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (162, '이력관리', '이력관리', '1', 4, 
    '이력관리', 1, 159, 
    'L', '/cms/golfMn/golfMnHisList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:27:34', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:54:29', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (163, '골프장 농약 사용량/잔류량 자료입력', '골프장 농약 사용량/잔류량 자료입력', '1', 3, 
    '골프장 농약 사용량/잔류량 자료입력', 1, 158, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:28:02', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (164, '골프장 농약사용량/잔류량 입력현황', '골프장 농약사용량/잔류량 입력현황', '1', 4, 
    '골프장 농약사용량/잔류량 입력현황', 1, 163, 
    'L', '/cms/golfPesticides/golfUsedResidueInputState', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:28:28', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:56:07', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (165, '농약사용량 개별입력', '농약사용량 개별입력', '1', 4, 
    '농약사용량 개별입력', 1, 163, 
    'L', '/cms/golfPesticides/golfUsedIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:28:43', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:56:30', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (166, '농약사용량 일괄입력', '농약사용량 일괄입력', '1', 4, 
    '농약사용량 일괄입력', 1, 163, 
    'L', '/cms/golfPesticides/golfUsedBundleInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:28:59', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:56:48', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (167, '농약잔류량 개별입력', '농약잔류량 개별입력', '1', 4, 
    '농약잔류량 개별입력', 1, 163, 
    'L', '/cms/golfPesticides/golfResidueIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:29:11', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:57:09', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (168, '농약잔류량 일괄입력', '농약잔류량 일괄입력', '1', 4, 
    '농약잔류량 일괄입력', 1, 163, 
    'L', '/cms/golfPesticides/golfResidueBundleInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:29:51', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:57:30', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (169, '골프장 현황관리', '골프장 현황관리', '1', 4, 
    '골프장 현황관리', 1, 163, 
    'L', '/cms/golfPesticides/golfStateMn', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:30:26', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:57:59', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (170, '가축매몰지', '가축매몰지', '1', 2, 
    '가축매몰지', 1, 125, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:32:46', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (171, '관리', '관리', '1', 3, 
    '관리', 1, 170, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:33:49', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (172, '매몰지조회', '매몰지조회', '1', 4, 
    '매몰지조회', 1, 171, 
    'L', '/cms/stockBury/stockBuryList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:34:03', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:58:18', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (173, '이력관리', '이력관리', '1', 4, 
    '이력관리', 1, 171, 
    'L', '/cms/stockBury/stockBuryHis', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:34:13', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/31/2018 12:59:38', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (174, '관정(150m이내)', '관정(150m이내)', '1', 3, 
    '관정(150m이내)', 1, 170, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:34:25', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (175, '수질조사결과목록', '수질조사결과목록', '1', 4, 
    '수질조사결과목록', 1, 174, 
    'L', '/cms/stockBury/waterSurveyResultList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:34:36', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:58:51', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (176, '주변지하수 일괄등록', '주변지하수 일괄등록', '1', 4, 
    '주변지하수 일괄등록', 1, 174, 
    'L', '/cms/stockBury/waterSurveyResultBundleInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:34:47', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:59:04', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (177, '과거자료 조회하기', '과거자료 조회하기', '1', 4, 
    '과거자료 조회하기', 1, 174, 
    'L', '/cms/stockBury/pastDataList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:34:58', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:59:25', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (178, '관정조회', '관정조회', '1', 4, 
    '관정조회', 1, 174, 
    'L', '/cms/stockBury/tubeWellList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:35:07', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:59:43', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (179, '이력관리', '이력관리', '1', 4, 
    '이력관리', 1, 174, 
    'L', '/cms/stockBury/tubeWellHis', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:35:21', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:59:57', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (180, '신규등록', '신규등록', '1', 4, 
    '신규등록', 1, 174, 
    'L', '/cms/stockBury/tubeWellReg', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:35:33', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/12/2018 11:36:49', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (181, '관측정(5m이내)', '관측정(5m이내)', '1', 3, 
    '관측정(5m이내)', 1, 170, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:35:52', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (182, '관측정조회', '관측정조회', '1', 4, 
    '관측정조회', 1, 181, 
    'L', '/cms/stockBury/monitorWellList', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:36:04', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 16:00:18', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (183, '신규등록', '신규등록', '1', 4, 
    '신규등록', 1, 181, 
    'L', '/cms/stockBury/monitorWellReg', 'N', 'Y', 
    'Y', TO_DATE('08/27/2018 14:36:16', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/12/2018 11:36:31', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (184, '토양오염실태조사', '토양오염실태조사', '1', 2, 
    '토양오염실태조사', 1, 125, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:36:28', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (185, '토양오염실태조사 지점관리', '토양오염실태조사 지점관리', '1', 3, 
    '토양오염실태조사 지점관리', 1, 184, 
    'D', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:36:50', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:37:12', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (186, '입력현황', '입력현황', '1', 4, 
    '입력현황', 1, 185, 
    'L', '/cms/soilPoll/soilPollInputState', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:37:05', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/03/2018 16:08:29', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (187, '토양오염실태조사 자료입력', '토양오염실태조사 자료입력', '1', 3, 
    '토양오염실태조사 자료입력', 1, 184, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:37:24', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (188, '입력현황총괄조회', '입력현황총괄조회', '1', 4, 
    '입력현황총괄조회', 1, 187, 
    'L', '/cms/soilPoll/soilPollTotalInputStateInfo', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:37:38', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/14/2018 09:29:13', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (190, '자료확정', '자료확정', '1', 4, 
    '자료확정', 1, 187, 
    'L', '/cms/soilPoll/soilPollDataFix', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:37:58', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/04/2018 14:10:42', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (191, '토양오염실태조사 개별입력', '토양오염실태조사 개별입력', '1', 4, 
    '토양오염실태조사 개별입력', 1, 187, 
    'L', '/cms/soilPoll/soilPollIndiviInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:38:08', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 16:01:42', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (192, '토양오염실태조사 일괄입력', '토양오염실태조사 일괄입력', '1', 4, 
    '토양오염실태조사 일괄입력', 1, 187, 
    'L', '/cms/soilPoll/soilPollBundleInput', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:38:18', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 16:01:53', 'MM/DD/YYYY HH24:MI:SS'), 'ce');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, TOPMENU_USE_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (194, '지리정보서비스', '지리정보서비스', '1', 1, 
    '지리정보서비스', 1, 0, 
    'L', 'Y', 'Y', 'Y', 
    'N', TO_DATE('08/27/2018 14:39:05', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, TOPMENU_USE_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (195, '정보마당', '정보마당', '1', 1, 
    '정보마당', 1, 0, 
    'D', 'N', 'Y', 'Y', 
    'N', TO_DATE('08/27/2018 14:39:19', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:39:54', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, BBS_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (196, '공지사항', '공지사항', '1', 2, 
    '공지사항', 1, 195, 1, 
    'B', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:40:18', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/18/2018 11:37:06', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, BBS_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (197, '메뉴얼 게시판', '메뉴얼 게시판', '1', 2, 
    '메뉴얼 게시판', 1, 195, 2, 
    'B', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:40:34', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/18/2018 11:37:16', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, TOPMENU_USE_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (198, '관리자 모드', '관리자 모드', '1', 1, 
    '관리자 모드', 1, 0, 
    'D', 'N', 'Y', 'Y', 
    'N', TO_DATE('08/27/2018 14:40:50', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (199, '회원관리', '회원관리', '1', 2, 
    '회원관리', 1, 198, 
    'L', '/cms/member', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:41:07', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:49:41', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (200, '메뉴관리', '메뉴관리', '1', 2, 
    '메뉴관리', 1, 198, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:41:21', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (201, '메뉴관리', '메뉴관리', '1', 3, 
    '메뉴관리', 1, 200, 
    'L', '/cms/menu', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:41:31', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:00:21', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (203, '메뉴별 권한관리', '메뉴별 권한관리', '1', 3, 
    '메뉴별 권한관리', 1, 200, 
    'L', '/cms/menuAuth', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:41:43', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:49:56', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (204, '사이트관리', '사이트관리', '1', 2, 
    '사이트관리', 1, 198, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:41:57', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (205, '코드관리', '코드관리', '1', 3, 
    '코드관리', 1, 204, 
    'L', '/cms/code', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:42:10', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:50:06', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (206, '팝업관리', '팝업관리', '1', 3, 
    '팝업관리', 1, 204, 
    'L', '/cms/popup', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:42:21', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:50:23', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (207, '게시판관리', '게시판관리', '1', 3, 
    '게시판관리', 1, 204, 
    'L', '/cms/boardCfg', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:42:35', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:50:35', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (208, '배너관리', '배너관리', '1', 3, 
    '배너관리', 1, 204, 
    'L', '/cms/banner', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:42:43', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:50:58', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (209, 'IP접근관리', 'IP접근관리', '1', 3, 
    'IP접근관리', 1, 204, 
    'L', '/cms/useIpMn', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:42:52', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('09/17/2018 15:40:41', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (210, '접속 관리', '접속 관리', '1', 2, 
    '접속 관리', 1, 198, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:43:11', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (211, '접속로그', '접속로그', '1', 3, 
    '접속로그', 1, 210, 
    'L', '/cms/accesLog', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:43:18', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:51:25', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (212, '접속통계', '접속통계', '1', 3, 
    '접속통계', 1, 210, 
    'L', '/cms/accessStat', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:43:26', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:51:38', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (213, '메뉴접속관리', '메뉴접속관리', '1', 2, 
    '메뉴접속관리', 1, 198, 
    'D', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:43:34', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 15:06:54', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (214, '메뉴접속 로그', '메뉴접속 로그', '1', 3, 
    '메뉴접속 로그', 1, 213, 
    'L', '/cms/accessMenuLog', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:43:43', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:52:31', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (215, '메뉴접속 통계', '메뉴접속 통계', '1', 3, 
    '메뉴접속 통계', 1, 213, 
    'L', '/cms/menuStat', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:43:51', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:52:47', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (216, '에러관리', '에러관리', '1', 2, 
    '에러관리', 1, 198, 
    'L', '/cms/errorLog', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:44:02', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:53:06', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGER_ID)
 Values
   (217, '서비스관리', '서비스관리', '1', 2, 
    '서비스관리', 1, 198, 
    'D', 'N', 'Y', 'N', TO_DATE('08/27/2018 14:44:12', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (218, '측정망/입력항목관리', '측정망/입력항목관리', '1', 3, 
    '측정망/입력항목관리', 1, 217, 
    'L', '/cms/mesureInputItemMn', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:44:23', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/30/2018 11:11:57', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
Insert into COM_MENU
   (MENU_NO, MENU_NM, ENG_MENU_NM, MENU_SE, MENU_LEVEL, MENU_DC, SORT_ORDR, UPPER_MENU_NO, CNTNTS_TY, LINK_URL, POPUP_AT, USE_AT, DELETE_AT, REGIST_DT, REGISTER_ID, CHANGE_DT, CHANGER_ID)
 Values
   (219, '측정망/입력기간설정', '측정망/입력기간설정', '1', 3, 
    '측정망/입력기간설정', 1, 217, 
    'L', '/cms/mesureInputTmMn', 'N', 'Y', 
    'N', TO_DATE('08/27/2018 14:44:33', 'MM/DD/YYYY HH24:MI:SS'), 'cetech', TO_DATE('08/27/2018 14:53:42', 'MM/DD/YYYY HH24:MI:SS'), 'cetech');
COMMIT;
