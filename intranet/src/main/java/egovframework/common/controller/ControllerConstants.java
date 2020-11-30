package egovframework.common.controller;

import egovframework.common.jfile.JProperties;
import egovframework.common.util.StringUtil;

/**
 * 컨트롤러 기본 상수
 * @author 개발팀 Bang-ji-hwan
 * @since 2013.08.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2013.08.31  bjh            최초 생성
 *
 * </pre>
 */
public interface ControllerConstants {

	/** 시스템 모드 */
	public static final String SYSTEM_MODE = StringUtil.noNull(JProperties.getString("SYSTEM_MODE"), "TEST");

	/** Y */
	public static final String Y = "Y";
	/** N */
	public static final String N = "N";

	/** 추가 */
	public static final String MODE_WRITE 		= "write";
	/** 수정 */
	public static final String MODE_MODIFY 		= "modify";
	/** 삭제 */
	public static final String MODE_DELETE		= "delete";
	/** 처리 */
	public static final String MODE_PROC		= "proc";
	/** 승인 */
	public static final String MODE_APPLOVE 	= "applove";
	/** 반려 */
	public static final String MODE_BACK 		= "back";
	/** 재접수 */
	public static final String MODE_REACCEPT 	= "reAccept";

	/** 정렬수정 */
	public static final String SORT_SAVE 		= "sortSave";
	/** 민원 답변 */
	public static final String MODE_REPLY 		= "reply";
	/** 댓글 */
	public static final String MODE_ANSWER 		= "answer";
	/** 회원 세션아이디 */
	public static final String SESSION_KEY_USER = "memberVO";

	/** 에러 처리 구분코드 */
	public static final String ERROR_ALERT_AND_NONE 	= "AlertAndNone";
	public static final String ERROR_ALERT_AND_BACK 	= "AlertAndBack";
	public static final String ERROR_ALERT_AND_RELOAD 	= "AlertAndReload";
	public static final String ERROR_ALERT_AND_REDIRECT = "AlertAndRedirect";
	public static final String ERROR_ALERT_AND_CLOSE 	= "AlertAndClose";
	public static final String ERROR_SCRIPT_ONLY 		= "ScriptOnly";
	public static final String ERROR_HANDLER_PATH 		= "cmmn/errorMessage";

}
