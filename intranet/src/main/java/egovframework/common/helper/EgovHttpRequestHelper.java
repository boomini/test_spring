package egovframework.common.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * @Class Name : EgovHttpRequestHelper.java
 * @Description : HTTP Request 정보 취득 Helper 클래스
 * @Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2014.09.11	표준프레임워크		최초생성
 *    2018.07.27	bang.jiHwan(ce)		    수정
* @author Vincent Han
 * @since 2014.09.11
 * @version 3.5
 * @see <pre>
 * web.xml 상에 다음과 같은 Listener 등록 필요
 * &lt;listener&gt;
 *	  &lt;listener-class&gt;org.springframework.web.context.getCurrentRequest().RequestContextListener&lt;/listener-class&gt;
 * &lt;/listener&gt;
 * </pre>
 */
public class EgovHttpRequestHelper {

	public static boolean isInHttpRequest() {
		try {
			getCurrentRequest();
		} catch (IllegalStateException ise) {
			return false;
		}

		return true;
	}

	public static HttpServletRequest getCurrentRequest() {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();

		return sra.getRequest();
	}

	public static String getRequestIp() {
		
		 String ip = null;
	        ip = getCurrentRequest().getHeader("X-Forwarded-For");
	        if (ip  == null || ip.length()  == 0 || "unknown".equalsIgnoreCase(ip)) { 
	            ip = getCurrentRequest().getHeader("Proxy-Client-IP"); 
	        } 
	        if (ip  == null || ip.length()  == 0 || "unknown".equalsIgnoreCase(ip)) { 
	            ip = getCurrentRequest().getHeader("WL-Proxy-Client-IP"); 
	        } 
	        if (ip  == null || ip.length()  == 0 || "unknown".equalsIgnoreCase(ip)) { 
	            ip = getCurrentRequest().getHeader("HTTP_CLIENT_IP"); 
	        } 
	        if (ip  == null || ip.length()  == 0 || "unknown".equalsIgnoreCase(ip)) { 
	            ip = getCurrentRequest().getHeader("HTTP_X_FORWARDED_FOR"); 
	        }
	        if (ip  == null || ip.length()  == 0 || "unknown".equalsIgnoreCase(ip)) { 
	            ip = getCurrentRequest().getHeader("X-Real-IP"); 
	        }
	        if (ip  == null || ip.length()  == 0 || "unknown".equalsIgnoreCase(ip)) { 
	            ip = getCurrentRequest().getHeader("X-RealIP"); 
	        }
	        if (ip  == null || ip.length()  == 0 || "unknown".equalsIgnoreCase(ip)) { 
	            ip = getCurrentRequest().getHeader("REMOTE_ADDR");
	        }
	        if (ip  == null || ip.length()  == 0 || "unknown".equalsIgnoreCase(ip)) { 
	            ip = getCurrentRequest().getRemoteAddr(); 
	        }
	        if (ip  == null || ip.length()  == 0 || "unknown".equalsIgnoreCase(ip)) { 
	        	ip = getCurrentRequest().getHeader("확인 X-FORWARDED-FOR"); 
	        }
		return ip;
	}

	public static String getRequestURI() {
		return getCurrentRequest().getRequestURI();
	}

	public static HttpSession getCurrentSession() {
		return getCurrentRequest().getSession();
	}
}
