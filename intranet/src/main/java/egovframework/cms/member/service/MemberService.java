package egovframework.cms.member.service;

import java.util.List;
import java.util.Map;

import egovframework.cms.member.MemberVo;

public interface MemberService {

	/**
	 * 회원정보 카운트
	 */
	public int getMemberCount(Map<String, Object> param) throws Exception;
	
	/**
	 * 회원정보 관리 조회
	 */
	public List<Map<String, Object>> getMemberList(Map<String, Object> param) throws Exception;
	
	/**
	 * 회원정보 관리 상세 조회
	 */
	public Map<String, Object> getMember(Map<String, Object> param) throws Exception;
	
	/**
	 * 회원정보 수정
	 */
	public int updateMember(Map<String, Object> param) throws Exception;

	/**
	 * 회원정보 삭제
	 */
	public int deleteMember(Map<String, Object> param) throws Exception;

	/**
	 * 로그인 실패 횟수 증가
	 */
	public int loginFailCountChg(Map<String, Object> param) throws Exception;

	/**
	 * 비밀번호 변경
	 */
	public int passwdChg(Map<String, Object> param) throws Exception;

	/**
	 * 비밀번호 초기화
	 */
	public int passwdInit(Map<String, Object> param) throws Exception;

	/**
	 * 세션 아이디 변경
	 */
	public int insertSession(Map<String, Object> param) throws Exception;

	/**
	 * 회원 상태 변경
	 */
	public int userStatChg(Map<String, Object> param) throws Exception;

	/**
	 * 회원 로그인 정보
	 */
	public MemberVo memberLogin(Map<String, Object> param) throws Exception;

	/**
	 * URL 권한 정보
	 */
	public List<Map<String, Object>> getAuthUrlList(Map<String, Object> param) throws Exception;

	/**
	 * 회원정보 등록
	 */
	public void insertMember(Map<String, Object> param) throws Exception;

	/**
	 * 아이디 찾기 기능 - getID
	 */
	public Map<String, Object> findSearchId(Map<String, Object> param) throws Exception;

	/**
	 * 비밀번호 찾기 기능 - getID
	 */
	public Map<String, Object> findSearchPass(Map<String, Object> param) throws Exception;

	/**
	 * 아이디 중복체크
	 */
	public int getIdDupCk(Map<String, Object> param) throws Exception;

	/**
	 * 세션 아이디 조회 기능 - getSessionId
	 */
	public Map<String, Object> getSessionId(Map<String, Object> param) throws Exception;

	/**
	 * 관리자 접근 아이피 체크
	 */
	public int getMngrUseIpCheckCnt(Map<String, Object> param) throws Exception;

}
