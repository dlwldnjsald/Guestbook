package himedia;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GuestbookServlet
 */
public class GuestbookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(GuestbookServlet.class.getSimpleName());
	
    private String appName;
    private String dbUser;
    private String dbPass;
    
    
    @Override
	public void init(ServletConfig config) throws ServletException {
		logger.info("[LifeCycle]: init");
		super.init(config);
		
		ServletContext servletContext = getServletContext();
		
		appName = servletContext.getInitParameter("appName");
		dbUser = servletContext.getInitParameter("dbUser");
		dbPass = servletContext.getInitParameter("dbPass");
		
		logger.info("dbUser:" + dbUser);
		logger.info("dbPass:" + dbPass);
	};

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("[LifeCycle]: service");
		super.service(req, resp);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("[LifeCycle]: doGet");
		
		resp.setContentType("text/html; charset= UTF-8");
		
		//사용자로부터 name 파라미터를 전달받아서 출력
		//파라미터로 데이터가 전달되는 GET방식의 요청을 처리하는 메서드
		String name = req.getParameter("name");
		
		if(name == null) {
			name = "아무개";
		}
		
		PrintWriter out = resp.getWriter();
		out.println("<h1>" + appName + "</h1>");
		out.println("<p>안녕하세요," + name + "님</p>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
