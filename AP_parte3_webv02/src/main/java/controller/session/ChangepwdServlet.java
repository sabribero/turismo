package controller.session;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import services.ChangePwdService;

@WebServlet("/cambiarpass")
public class ChangepwdServlet extends HttpServlet implements Servlet {

	private static final long serialVersionUID = 410281248960916698L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Usuario user = (Usuario) req.getSession().getAttribute("user");
		if (user.isNull()) {
    		resp.sendRedirect("/AP_parte3_webv02/index.jsp");    		
		} else if (user.getEsAdmin()) {
       		resp.sendRedirect("/AP_parte3_webv02/views/admin/admin.jsp");
       	} else {
       		resp.sendRedirect("/AP_parte3_webv02/views/user/user.jsp");
       	}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String oldpass = req.getParameter("old-password");
		String newpass = req.getParameter("new-password");
		String repass = req.getParameter("re-password");
		Usuario user = (Usuario) req.getSession().getAttribute("user");
		
		switch (ChangePwdService.change(user,oldpass,newpass,repass)) {
			case 1:
				req.setAttribute("flash", "La contraseña se a cambiado correctamente.");
				req.setAttribute("colormsg", "alert alert-success");
				break;
			case 2:
				req.setAttribute("flash", "Contraseña incorrecta.");
				req.setAttribute("colormsg", "alert alert-danger");
				break;
			case 3:
				req.setAttribute("flash", "Las contraseñas ingresadas no coinciden o son inválidas.");
				req.setAttribute("colormsg", "alert alert-danger");
				break;
			default:
				req.setAttribute("flash", "La contraseña no se ha cambiado.");
				req.setAttribute("colormsg", "alert alert-danger");
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/cambiarpass.jsp");
		dispatcher.forward(req, resp);
	
	}
}
