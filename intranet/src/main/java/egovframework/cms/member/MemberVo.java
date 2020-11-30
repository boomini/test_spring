package egovframework.cms.member;

public class MemberVo {

	private String user_id; /* 사용자ID */
	private String user_nm; /* 사용자명 */
	private String password; /* 비밀번호 */
	private String author_code; /* 권한코드 */
	private String author_code_nm; /* 권한코드명 */
	private String brthdy; /* 생년월일 */
	private String telno; /* 전화번호 */
	private String mbtlnum; /* 휴대폰번호 */
	private String email; /* 메일 */
	private String use_at; /* 사용여부 */
	private String regist_dt; /* 생성일시 */
	private String register_id; /* 생성자ID */
	private String change_dt; /* 변경일시 */
	private String changer_id; /* 변경자ID */
	private String return_prvonsh; /* 반려사유 */
	private int    login_fail_co; /* 로그인 실패 횟수 */
	private String org_code;  /* 기관 코드 */
	private String sido_code; /* 시군구 코드 */
	private String river_code; /* 청 코드 */
	
	private String user_ip; /*사용자 IP*/

	private String login_dt; /* 로그인 시간 */

	private boolean isAdmin; // 관리자 여부

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_nm() {
		return user_nm;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}

	public String getAuthor_code() {
		return author_code;
	}

	public void setAuthor_code(String author_code) {
		this.author_code = author_code;
	}

	public String getAuthor_code_nm() {
		return author_code_nm;
	}

	public void setAuthor_code_nm(String author_code_nm) {
		this.author_code_nm = author_code_nm;
	}

	public String getBrthdy() {
		return brthdy;
	}

	public void setBrthdy(String brthdy) {
		this.brthdy = brthdy;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getMbtlnum() {
		return mbtlnum;
	}

	public void setMbtlnum(String mbtlnum) {
		this.mbtlnum = mbtlnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUse_at() {
		return use_at;
	}

	public void setUse_at(String use_at) {
		this.use_at = use_at;
	}

	public String getRegist_dt() {
		return regist_dt;
	}

	public void setRegist_dt(String regist_dt) {
		this.regist_dt = regist_dt;
	}
	
	public String getRegister_id() {
		return register_id;
	}

	public void setRegister_id(String register_id) {
		this.register_id = register_id;
	}

	public String getChange_dt() {
		return change_dt;
	}

	public void setChange_dt(String change_dt) {
		this.change_dt = change_dt;
	}

	public String getChanger_id() {
		return changer_id;
	}

	public void setChanger_id(String changer_id) {
		this.changer_id = changer_id;
	}

	public boolean getIsAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getLogin_dt() {
		return login_dt;
	}

	public void setLogin_dt(String login_dt) {
		this.login_dt = login_dt;
	}


	public String getReturn_prvonsh() {
		return return_prvonsh;
	}

	public void setReturn_prvonsh(String return_prvonsh) {
		this.return_prvonsh = return_prvonsh;
	}
	
	

	public int getLogin_fail_co() {
		return login_fail_co;
	}

	public void setLogin_fail_co(int login_fail_co) {
		this.login_fail_co = login_fail_co;
	}
	
	

	public String getOrg_code() {
		return org_code;
	}

	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}

	
	
	public String getSido_code() {
		return sido_code;
	}

	public void setSido_code(String sido_code) {
		this.sido_code = sido_code;
	}
	
	
	

	public String getRiver_code() {
		return river_code;
	}

	public void setRiver_code(String river_code) {
		this.river_code = river_code;
	}

	public String getUser_ip() {
		return user_ip;
	}

	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}

	@Override
	public String toString() {
		return "MemberVo [user_id=" + user_id + ", user_nm=" + user_nm + ", password=" + password + ", author_code=" + author_code + ", author_code_nm=" + author_code_nm + ", brthdy=" + brthdy + ", telno=" + telno + ", mbtlnum=" + mbtlnum + ", email=" + email + ", use_at=" + use_at + ", regist_dt=" + regist_dt + ", register_id=" + register_id + ", change_dt=" + change_dt + ", changer_id=" + changer_id + ", return_prvonsh=" + return_prvonsh + ", login_fail_co=" + login_fail_co + ", org_code=" + org_code + ", sido_code=" + sido_code + ", user_ip=" + user_ip + ", login_dt=" + login_dt + ", isAdmin=" + isAdmin + "]";
	}

	


}