package himedia.controller;

import java.io.IOException;
import java.util.List;

import himedia.dao.GuestbookDao;
import himedia.dao.GuestbookDaoOracleImpl;
import himedia.vo.GuestbookVo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GuestbookServlet
 */
public class GuestbookServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(GuestbookServlet.class.getSimpleName());
	
    private String appname;
    private String dbuser;
    private String dbpass;
    
    
    @Override
	public void init(ServletConfig config) throws ServletException {
		logger.info("[LifeCycle]: init");
		super.init(config);
		
		ServletContext servletContext = getServletContext();
		
		appname = servletContext.getInitParameter("appname");
		dbuser = servletContext.getInitParameter("dbuser");
		dbpass = servletContext.getInitParameter("dbpass");
		
		logger.info("dbuser:" + dbuser);
		logger.info("dbpass:" + dbpass);
	};


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("[LifeCycle]: doGet");
		
		resp.setContentType("text/html; charset= UTF-8");
		
		//사용자로부터 name 파라미터를 전달받아서 출력
		//파라미터로 데이터가 전달되는 GET방식의 요청을 처리하는 메서드
		String actionName = req.getParameter("name");
		
		if("name".equals(actionName)) {
			
			RequestDispatcher rd =getServletContext()
					.getRequestDispatcher("/WEB-INF/views/add.jsp");
			
			rd.forward(req, resp);
		} else {
			//목록 받아오는 부분 /gb
			
			GuestbookDao dao = new GuestbookDaoOracleImpl(dbuser,dbpass);
			List<GuestbookVo> list = dao.getList();
			System.out.println("list:" +list);
			
			req.setAttribute("list", list);
			
			RequestDispatcher rd = getServletContext()
								.getNamedDispatcher("/WEB_INF/views/list.jsp");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
