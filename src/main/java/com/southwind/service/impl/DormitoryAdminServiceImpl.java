package com.southwind.service.impl;

import com.southwind.dao.DormitoryAdminDao;
import com.southwind.dao.impl.DormitoryAdminDaoImpl;
import com.southwind.dto.DormitoryAdminDto;
import com.southwind.entity.DormitoryAdmin;
import com.southwind.service.DormitoryAdminService;

import java.util.List;

public class DormitoryAdminServiceImpl implements DormitoryAdminService {

    private DormitoryAdminDao dormitoryAdminDao = new DormitoryAdminDaoImpl();

    @Override
    public List<DormitoryAdmin> list() {
        return this.dormitoryAdminDao.list();
    }

    @Override
    public List<DormitoryAdmin> search(String key, String value) {
        if(value.equals("")) return this.dormitoryAdminDao.list();
        return this.dormitoryAdminDao.search(key, value);
    }

    @Override
    public void save(DormitoryAdmin dormitoryAdmin) {
        Integer save = this.dormitoryAdminDao.save(dormitoryAdmin);
        if(save != 1) throw new RuntimeException("Error");
    }

    @Override
    public void update(DormitoryAdmin dormitoryAdmin) {
        Integer update = this.dormitoryAdminDao.update(dormitoryAdmin);
        if(update != 1) throw new RuntimeException("Error");
    }

    @Override
    public void delete(Integer id) {
        Integer delete = this.dormitoryAdminDao.delete(id);
        if(delete != 1) throw new RuntimeException("Error");
    }

    @Override
    public DormitoryAdminDto login(String username, String password) {
        DormitoryAdmin dormitoryAdmin = this.dormitoryAdminDao.findByUsername(username);
        DormitoryAdminDto dormitoryAdminDto = new DormitoryAdminDto();
        if(dormitoryAdmin == null){
            dormitoryAdminDto.setCode(-1);
        } else {
            if(!dormitoryAdmin.getPassword().equals(password)){
                dormitoryAdminDto.setCode(-2);
            } else {
                dormitoryAdminDto.setCode(0);
                dormitoryAdminDto.setDormitoryAdmin(dormitoryAdmin);
            }
        }
        return dormitoryAdminDto;
    }
}
