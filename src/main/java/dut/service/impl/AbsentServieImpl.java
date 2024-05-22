package dut.service.impl;

import dut.dao.AbsentDao;
import dut.dao.impl.AbsentDaoImpl;
import dut.entity.Absent;
import dut.service.AbsentService;

import java.util.List;

public class AbsentServieImpl implements AbsentService {

    private final AbsentDao absentDao = new AbsentDaoImpl();

    @Override
    public void save(Absent absent) {
        Integer save = this.absentDao.save(absent);
        if(save != 1) throw new RuntimeException("Error");
    }

    @Override
    public List<Absent> list() {
        return this.absentDao.list();
    }

    @Override
    public List<Absent> search(String key, String value) {
        if(value.isEmpty()) return this.absentDao.list();
        return this.absentDao.search(key, value);
    }
}
