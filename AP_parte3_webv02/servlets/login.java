package servlets;

public class login extends HttpServlet {
	   ... 
	   //metodo encargado de la gestión del método POST
	   
	   
	   @WebServlet("/login")
	    protected void processRequestPOST(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        HttpSession sesion = request.getSession();
	        String usu, pass;
	        usu = request.getParameter("user");
	        pass = request.getParameter("password");
	        
	        
	        //Aca deberiamos buscar el usuario en la base de datos
	        
	        if(usu.equals("admin") && pass.equals("admin") && sesion.getAttribute("usuario") == null){
	            //si coincide usuario y password y además no hay sesión iniciada
	            sesion.setAttribute("admin", usu);
	            //redirijo a página con información de login exitoso
	            response.sendRedirect("admin.jsp");
	        }else{
		        if(usu.equals("user") && pass.equals("user") && sesion.getAttribute("usuario") == null){
		            //si coincide usuario y password y además no hay sesión iniciada
		            sesion.setAttribute("user", usu);
		            //redirijo a página con información de login exitoso
		            response.sendRedirect("user.jsp");
		        }else{
		            //lógica para login inválido
		        }
	        }
	    }
	    
	   //método encargado de la gestión del método GET
	    protected void processRequestGET(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        //me llega la url "proyecto/login/out"
	        String action=(request.getPathInfo()!=null?request.getPathInfo():"");
	        HttpSession sesion = request.getSession();
	        if(action.equals("/out")){
	            sesion.invalidate();
	            response.sendRedirect("/index.jsp");
	        }else{
	           
	        }
	    }
	 ...
	}