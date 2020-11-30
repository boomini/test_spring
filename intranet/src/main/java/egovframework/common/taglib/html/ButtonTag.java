package egovframework.common.taglib.html;

import java.io.IOException;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.common.util.StringUtil;

/**
 * 설 명 : 권한체크 후 버튼 보이기/숨기기 처리
 * @author 개발팀 Bang-ji-hwan
 * @since 2018. 7. 26.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자              수정내용
 *  -------       --------    ---------------------------
 *  2018. 7. 26.     bjh                최초 생성
 * </pre>
 */
public class ButtonTag extends DefaultTagSupport {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	private static final long serialVersionUID = -3845824886278697801L;

	/* 구분자 add:추가, mod:수정, del:삭제, save:저장, proc:처리 */
	private String gubun;
	/* 스크립트 function등 */
	private String script;
	/* 버튼명 */
	private String title;
	/* 이미지 url */
	private String url;
	/* 클래스명 */
	private String classNm;
	/* a 태그 ID */
	private String id;
	/* 이미지 사용여부 */
	private String imgYn;

	public int doStartTag() throws JspException {
		return (SKIP_BODY);
	}

	@SuppressWarnings("unchecked")
	public int doEndTag() throws JspException {
		Map<String, Object> map = (Map<String, Object>) super.pageContext.getRequest().getAttribute("menuMap");

		JspWriter out = super.pageContext.getOut();
		StringBuffer html = new StringBuffer();

		String imgUrl = "";
		String title = "";
		if (map != null) {
			String insYn = StringUtil.noNull(map.get("REGISTE_AUTHOR_AT"));
			String updYn = StringUtil.noNull(map.get("CHANGE_AUTHOR_AT"));
			String delYn = StringUtil.noNull(map.get("DELETE_AUTHOR_AT"));
			if(StringUtil.noNull(classNm).equals("")) classNm = "btn_1";
			if (gubun.equals("add") && insYn.equals("Y")) {
				title = StringUtil.noNull(this.title, "등 록");
				buttonCreate(html, title, imgUrl);
			} else if (gubun.equals("mod") && updYn.equals("Y")) {
				title = StringUtil.noNull(this.title, "수 정");
				buttonCreate(html, title, imgUrl);
			} else if (gubun.equals("del") && delYn.equals("Y")) {
				title = StringUtil.noNull(this.title, "삭 제");
				buttonCreate(html, title, imgUrl);
			} else if (gubun.equals("save") && insYn.equals("Y")) {
				title = StringUtil.noNull(this.title, "저 장");
				buttonCreate(html, title, imgUrl);
			} else if (gubun.equals("proc") && insYn.equals("Y")) {
				title = StringUtil.noNull(this.title, "처 리");
				buttonCreate(html, title, imgUrl);
			} else if (gubun.equals("etc")) {
				buttonCreate(html, title, imgUrl);
			}
		} else {
			if (gubun.equals("etc")) {
				buttonCreate(html, title, imgUrl);
			}
		}
		try {
			out.print(html.toString());
		} catch (IOException e) {
			log.info("IOException: " + e.toString());
		}
		return (SKIP_BODY);
	}

	/**
	 * 버튼 생성
	 * 
	 * @param html
	 * @param title
	 * @param imgUrl
	 */
	public void buttonCreate(StringBuffer html, String title, String imgUrl) {
		String classNm = "white";
		if (this.title != null) {
			title = this.title;
		}
		if (this.url != null) {
			imgUrl = this.url;
		}
		if (this.classNm != null) {
			classNm = this.classNm;
		}
		if (this.imgYn == null) {
			this.imgYn = "Y";
		}
		if (!title.equals("")) {
			html.append("<a href='#' class='" + classNm + "' title='" + title + "'");
			if (this.id != null) {
				html.append(" id='" + this.id + "'");
			}
			if (this.script != null) {
				html.append(" onclick=\"" + script + "\"");
			}
			html.append(" >");
			if (!imgUrl.equals("") && imgYn.equals("Y")) {
				html.append("<img src='" + imgUrl + "' alt='" + title + "' /> ");
			}
			html.append(title + "</a>");
		}
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	public String getScript() {
		return script;
	}

	public void setScript(String script) {
		this.script = script;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}


	public String getClassNm() {
		return classNm;
	}

	public void setClassNm(String classNm) {
		this.classNm = classNm;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImgYn() {
		return imgYn;
	}

	public void setImgYn(String imgYn) {
		this.imgYn = imgYn;
	}

}
