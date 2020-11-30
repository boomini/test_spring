package egovframework.cms.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.cms.member.MemberVo;
import egovframework.common.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("MemberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService {

	@Resource(name = "CommonMapper")
	private CommonMapper commonMapper;

	private String namespace = "memberMapper.";

	/**
	 * 회원정보 카운트
	 */
	@Override
	public int getMemberCount(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMemberCount");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}

	/**
	 * 회원정보 관리 조회
	 */
	@Override
	public List<Map<String, Object>> getMemberList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMemberList");
		List<Map<String, Object>> reslutList = commonMapper.getList(param);
		return reslutList;
	}

	/**
	 * 회원정보 관리 상세 조회
	 */
	@Override
	public Map<String, Object> getMember(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMember");
		Map<String, Object> reslutMap = commonMapper.get(param);
		return reslutMap;
	}

	/**
	 * 회원정보 수정
	 */
	@Override
	public int updateMember(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "updateMember");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 회원정보 삭제
	 */
	@Override
	public int deleteMember(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "deleteMember");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 로그인 실패 횟수 증가
	 */
	@Override
	public int loginFailCountChg(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "loginFailCountChg");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 비밀번호 변경
	 */
	@Override
	public int passwdChg(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "passwdChg");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 세션 아이디 변경
	 */
	public int insertSession(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertSession");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 비밀번호 초기화
	 */
	@Override
	public int passwdInit(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "passwdInit");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 회원 상태 변경
	 */
	@Override
	public int userStatChg(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "userStatChg");
		int resultInt = commonMapper.update(param);
		return resultInt;
	}

	/**
	 * 회원 로그인 정보
	 */
	@Override
	public MemberVo memberLogin(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "memberLogin");
		MemberVo memberVo = (MemberVo) commonMapper.getObject(param);
		return memberVo;
	}

	/**
	 * URL 권한 정보
	 */
	public List<Map<String, Object>> getAuthUrlList(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getAuthUrlList");
		List<Map<String, Object>> resultList = commonMapper.getList(param);
		return resultList;
	}

	/**
	 * 아이디 중복체크
	 */
	@Override
	public int getIdDupCk(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getIdDupCk");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}

	/**
	 * 회원정보 등록
	 */
	@Override
	public void insertMember(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "insertMember");
		commonMapper.insert(param);
	}

	/**
	 * 아이디 찾기 기능 - getID
	 */
	@Override
	public Map<String, Object> findSearchId(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "findSearchId");
		Map<String, Object> resultMap = commonMapper.get(param);
		return resultMap;
	}

	/**
	 * 비밀번호 찾기 기능 - getID
	 */
	@Override
	public Map<String, Object> findSearchPass(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "findSearchPass");
		Map<String, Object> resultMap = commonMapper.get(param);
		return resultMap;
	}

	/**
	 * 세션 아이디 조회 기능 - getSessionId
	 */
	@Override
	public Map<String, Object> getSessionId(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getSessionId");
		Map<String, Object> resultMap = commonMapper.get(param);
		return resultMap;
	}

	/**
	 * 관리자 접근 아이피 체크
	 */
	@Override
	public int getMngrUseIpCheckCnt(Map<String, Object> param) throws Exception {
		param.put("mId", namespace + "getMngrUseIpCheckCnt");
		int resultInt = commonMapper.getCount(param);
		return resultInt;
	}
}
