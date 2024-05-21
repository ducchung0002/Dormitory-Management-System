package dut.service;

import dut.dto.SystemAdminDto;

public interface SystemAdminService {
    public SystemAdminDto login(String username, String password);
}
