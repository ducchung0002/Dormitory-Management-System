package dut.service.impl;

import dut.dao.SystemAdminDao;
import dut.dao.impl.SystemAdminDaoImpl;
import dut.dto.SystemAdminDto;
import dut.entity.SystemAdmin;
import dut.service.SystemAdminService;

public class SystemAdminServiceImpl implements SystemAdminService {

    private final SystemAdminDao systemAdminDao = new SystemAdminDaoImpl();

    @Override
    public SystemAdminDto login(String username, String password) {
        SystemAdmin systemAdmin = this.systemAdminDao.findByUsername(username);
        SystemAdminDto systemAdminDto = new SystemAdminDto();
        if (systemAdmin == null) {
            systemAdminDto.setCode(-1); // -1: username not found
        } else {
            if (!systemAdmin.getPassword().equals(password)) {
                systemAdminDto.setCode(-2); // -2: password incorrect
            } else {
                systemAdminDto.setCode(0); // 0: login success
                systemAdminDto.setSystemAdmin(systemAdmin);
            }
        }
        return systemAdminDto;
    }
}
