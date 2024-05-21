package dut.dao.impl;

import dut.dao.SystemAdminDao;
import dut.entity.SystemAdmin;
import dut.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SystemAdminDaoImpl implements SystemAdminDao {

    @Override
    public SystemAdmin findByUsername(String username) {
        Connection connection = JDBCUtil.getConnection();
        String sql = "SELECT id, username, password, name, telephone FROM system_admin WHERE username = ?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new SystemAdmin(resultSet.getInt(1),
                        username,
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.release(connection, statement, resultSet);
        }
        return null;
    }
}
