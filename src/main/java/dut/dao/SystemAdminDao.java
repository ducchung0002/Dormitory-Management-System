package dut.dao;

import dut.entity.SystemAdmin;

public interface SystemAdminDao {
    SystemAdmin findByUsername(String username);
}
