package dut.controller;

import dut.dto.DormitoryAdminDto;
import dut.dto.SystemAdminDto;
import dut.service.DormitoryAdminService;
import dut.service.SystemAdminService;
import dut.service.impl.DormitoryAdminServiceImpl;
import dut.service.impl.SystemAdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/account")
public class AccountServlet extends HttpServlet {

    private final SystemAdminService systemAdminService = new SystemAdminServiceImpl();
    private final DormitoryAdminService dormitoryAdminService = new DormitoryAdminServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        switch (method){
            case "login":
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                String type = req.getParameter("type");
                switch (type){
                    case "systemAdmin":
                        SystemAdminDto systemAdminDto = this.systemAdminService.login(username, password);
                        switch (systemAdminDto.getCode()){
                            case -1: // -1: username not found
                                req.setAttribute("usernameError", "Tài khoản không tồn tại");
                                req.getRequestDispatcher( req.getContextPath() + "/login.jsp").forward(req, resp);
                                break;
                            case -2: // -2: password incorrect
                                req.setAttribute("passwordError", "Mật khẩu không chính xác");
                                req.getRequestDispatcher(req.getContextPath() + "/login.jsp").forward(req, resp);
                                break;
                            case 0: // 0: login success
                                // Redirect to login success UI
                                HttpSession session = req.getSession();
                                session.setAttribute("systemAdmin", systemAdminDto.getSystemAdmin());
                                resp.sendRedirect(req.getContextPath() + "/systemadmin.jsp");
                                break;
                        }
                        break;
                    case "dormitoryAdmin":
                        DormitoryAdminDto dormitoryAdminDto = this.dormitoryAdminService.login(username, password);
                        switch (dormitoryAdminDto.getCode()){
                            case -1:
                                req.setAttribute("usernameError", "Tài khoản không tồn tại");
                                req.getRequestDispatcher(req.getContextPath() + "/login.jsp").forward(req, resp);
                                break;
                            case -2:
                                req.setAttribute("passwordError", "Mật khẩu không chính xác");
                                req.getRequestDispatcher(req.getContextPath() + "/login.jsp").forward(req, resp);
                                break;
                            case 0:
                                // Redirect to login success UI
                                HttpSession session = req.getSession();
                                session.setAttribute("dormitoryAdmin", dormitoryAdminDto.getDormitoryAdmin());
                                resp.sendRedirect(req.getContextPath() + "/dormitoryadmin.jsp");
                                break;
                        }
                        break;
                }
                break;
            case "logout":
                req.getSession().invalidate();
                resp.sendRedirect(req.getContextPath() + "/login.jsp");
                break;
        }

    }
}
