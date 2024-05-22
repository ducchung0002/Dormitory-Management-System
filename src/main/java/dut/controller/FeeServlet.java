package dut.controller;

import com.google.gson.Gson;
import dut.entity.*;
import dut.service.BuildingService;
import dut.service.DormitoryService;
import dut.service.StudentService;
import dut.service.impl.BuildingServiceImpl;
import dut.service.impl.DormitoryServiceImpl;
import dut.service.impl.StudentServiceImpl;
import dut.util.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/fee")
public class FeeServlet extends HttpServlet {
    private final DormitoryService dormitoryService = new DormitoryServiceImpl();
    private final BuildingService buildingService = new BuildingServiceImpl();
    private final StudentService studentService = new StudentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String method = req.getParameter("method");
        switch (method){
            case "display":
                req.setAttribute("list", this.dormitoryService.list());
                req.setAttribute("buildingList", this.buildingService.list());
                req.getRequestDispatcher("feemanager.jsp").forward(req, resp);
                break;
            case "save":
                String buildingIdStr = req.getParameter("buildingId");
                Integer buildingId = Integer.parseInt(buildingIdStr);
                String dormitoryIdStr = req.getParameter("dormitoryId");
                Integer dormitoryId = Integer.parseInt(dormitoryIdStr);
                String studentIdStr = req.getParameter("studentId");
                Integer studentId = Integer.parseInt(studentIdStr);
                Integer year = Integer.parseInt(req.getParameter("year"));
                Integer month = Integer.parseInt(req.getParameter("month"));
                Float amount = Float.parseFloat(req.getParameter("amount"));
                HttpSession session = req.getSession();
                SystemAdmin systemAdmin = (SystemAdmin) session.getAttribute("systemAdmin");

                Connection connection = JDBCUtil.getConnection();
                String sql = "insert into fee(student_id, admin_id, year, month, amount) values(?,?,?,?,?)";
                PreparedStatement statement = null;
                Integer result = null;
                try {
                    statement = connection.prepareStatement(sql);
                    statement.setInt(1, studentId);
                    statement.setInt(2, systemAdmin.getId());
                    statement.setInt(3, year);
                    statement.setInt(4, month);
                    statement.setFloat(5, amount);
                    result = statement.executeUpdate();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                } finally {
                    JDBCUtil.release(connection, statement, null);
                }
                req.getRequestDispatcher("feemanager.jsp").forward(req, resp);
                break;
            case "search":
                year = Integer.parseInt(req.getParameter("year"));
                month = Integer.parseInt(req.getParameter("month"));
                connection = JDBCUtil.getConnection();
                sql = "select s.id, s.number, s.name, s.state, ff.amount from student as s left outer join (select * from fee as f where year = ? and month = ?) as ff on s.id = ff.student_id";
                statement = null;
                ResultSet rs = null;
                List<FeeView> list = new ArrayList<>();
                try {
                    statement = connection.prepareStatement(sql);
                    statement.setInt(1, year);
                    statement.setInt(2, month);
                    rs = statement.executeQuery();
                    while (rs.next()){
                        list.add(new FeeView(rs.getFloat("amount"), rs.getString("name"), rs.getString("number"), rs.getInt("id"), rs.getString("state")));
                    }
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                } finally {
                    JDBCUtil.release(connection, statement, null);
                }
                req.setAttribute("list", list);
                req.getRequestDispatcher("feeview.jsp").forward(req, resp);
                break;
            case "all":
                req.setAttribute("list", new ArrayList<FeeView>());
                req.getRequestDispatcher("feeview.jsp").forward(req, resp);
                break;
        }
    }
}

