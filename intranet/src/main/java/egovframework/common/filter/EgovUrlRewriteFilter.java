package egovframework.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.AntPathMatcher;

/**
 * @Class Name : UrlRewriteFilter.java
 * @Description : UrlRewriteFilter Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2014.09.30           최초생성
 * @ 2018.01.23   방지환  전체적용건 추가
 *
 * @author 전자정부 표준프레임워크 유지보수
 * @since 2014. 09.30
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class EgovUrlRewriteFilter implements Filter {

	@SuppressWarnings("unused")
	private FilterConfig config;

	private String targetURI;
	private String httpsPort;
	private String httpPort;

	private String[] uriPatterns;

    @Override
    public void init(FilterConfig config) throws ServletException {

    	String delimiter = ",";
		this.config = config;

		this.targetURI = config.getInitParameter("targetURI");
		this.httpsPort = config.getInitParameter("httpsPort");
		this.httpPort = config.getInitParameter("httpPort");

		this.uriPatterns = targetURI.split(delimiter);

    }

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		//jfile 이미지 보여주는데 오류가 있어서 다시 주석으로 처리함
		//res.setHeader("X-Frame-Options", "SAMEORIGIN");
		// HTTP Strict-Transport-Security 헤더 누락
		//res.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
		// Missing "X-Content-Type-Options" header
		//res.setHeader("X-Content-Type-Options", "nosniff");
		// Missing "X-XSS-Protection" header
		//res.setHeader("X-XSS-Protection", "1");

		String uri = req.getRequestURI();
		String getProtocol = req.getScheme();
		String getDomain = req.getServerName();

		AntPathMatcher pm = new AntPathMatcher();

		for (String uriPattern : uriPatterns) {
			if (uriPattern.trim().equals("ALL")) {
				
				if (getProtocol.toLowerCase().equals("http")) {
					 response.setContentType("text/html");
					 String httpsPath = "https" + "://" + getDomain + ":" + httpsPort + uri;
					 String site = new String(httpsPath);
					 res.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
					 if (site == null || "".equals(site)) return;    
					 String filtered_site = site.replaceAll("\r", "").replaceAll("\n", "");   
					 res.setHeader("Location", filtered_site);
				 }
				break;
				
			}else if (pm.match(uriPattern.trim(), uri)) {

				 if (getProtocol.toLowerCase().equals("http")) {

					 response.setContentType("text/html");

					 String httpsPath = "https" + "://" + getDomain + ":" + httpsPort + uri;
					 String site = new String(httpsPath);
					 res.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
					 if (site == null || "".equals(site)) return;    
					 String filtered_site = site.replaceAll("\r", "").replaceAll("\n", "");  
					 res.setHeader("Location", filtered_site);

				 }

			}else if(getProtocol.toLowerCase().equals("https")){

				response.setContentType("text/html");

				String httpPath = "http" + "://" + getDomain + ":" + httpPort + uri;

				String site = new String(httpPath);
				res.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
				if (site == null || "".equals(site)) return;    
				 String filtered_site = site.replaceAll("\r", "").replaceAll("\n", "");  
				 res.setHeader("Location", filtered_site);

			}
		}

		chain.doFilter(req, res);

	}

    @Override
    public void destroy() {
    	this.targetURI = null;
    	this.httpsPort = null;
		this.httpPort = null;
		this.uriPatterns = null;
    }

}
