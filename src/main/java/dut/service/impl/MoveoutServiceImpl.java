package dut.service.impl;

import dut.dao.DormitoryDao;
import dut.dao.MoveoutDao;
import dut.dao.StudentDao;
import dut.dao.impl.DormitoryDaoImpl;
import dut.dao.impl.MoveoutDaoImpl;
import dut.dao.impl.StudentDaoImpl;
import dut.entity.Moveout;
import dut.service.MoveoutService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class MoveoutServiceImpl implements MoveoutService {

    private final MoveoutDao moveoutDao = new MoveoutDaoImpl();
    private final StudentDao studentDao = new StudentDaoImpl();
    private final DormitoryDao dormitoryDao = new DormitoryDaoImpl();

    @Override
    public void save(Moveout moveout) {
        Integer updateStateById = this.studentDao.updateStateById(moveout.getStudentId());
        Integer addAvailable = this.dormitoryDao.addAvailable(moveout.getDormitoryId());
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        moveout.setCreateDate(simpleDateFormat.format(date));
        Integer save = this.moveoutDao.save(moveout);
        if(save != 1 || updateStateById != 1 || addAvailable != 1) throw new RuntimeException("Error");
    }

    @Override
    public List<Moveout> list() {
        return this.moveoutDao.list();
    }

    @Override
    public List<Moveout> search(String key, String value) {
        if(value.isEmpty()) return this.moveoutDao.list();
        return this.moveoutDao.search(key, value);
    }
}
