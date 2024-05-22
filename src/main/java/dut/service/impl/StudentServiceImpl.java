package dut.service.impl;

import dut.dao.DormitoryDao;
import dut.dao.StudentDao;
import dut.dao.impl.DormitoryDaoImpl;
import dut.dao.impl.StudentDaoImpl;
import dut.entity.Student;
import dut.service.StudentService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class StudentServiceImpl implements StudentService {

    private final StudentDao studentDao = new StudentDaoImpl();
    private final DormitoryDao dormitoryDao = new DormitoryDaoImpl();

    @Override
    public List<Student> list() {
        return this.studentDao.list();
    }

    @Override
    public List<Student> listMoved() {
        return this.studentDao.listMoved();
    }

    @Override
    public List<Student> search(String key, String value) {
        if(value.isEmpty()) return this.studentDao.list();
        return this.studentDao.search(key, value);
    }

    @Override
    public void save(Student student) {
        student.setState("đang ở");
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        student.setCreateDate(simpleDateFormat.format(date));
        Integer save = this.studentDao.save(student);
        Integer sub = this.dormitoryDao.subAvailable(student.getDormitoryId());
        if(save != 1 || sub != 1) throw new RuntimeException("Error");
    }

    @Override
    public void update(Student student,Integer oldDormitoryId) {
        Integer update = this.studentDao.update(student);
        Integer dormitory1 = this.dormitoryDao.addAvailable(oldDormitoryId);
        Integer dormitory2 = this.dormitoryDao.subAvailable(student.getDormitoryId());
        if(update != 1 || dormitory1 != 1 || dormitory2 != 1) throw new RuntimeException("Error");
    }

    @Override
    public void movein(Student student) {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        student.setCreateDate(simpleDateFormat.format(date));
        Integer save = this.studentDao.movein(student);
        Integer sub = this.dormitoryDao.subAvailable(student.getDormitoryId());
        if(save != 1 || sub != 1) throw new RuntimeException("Error");
    }

    @Override
    public void delete(Integer id, Integer dormitoryId) {
        Integer delete = this.studentDao.delete(id);
        Integer available = this.dormitoryDao.addAvailable(dormitoryId);
        if(delete != 1 || available != 1) throw new RuntimeException("Error");
    }

    @Override
    public List<Student> moveoutList() {
        return this.studentDao.moveoutList();
    }

    @Override
    public List<Student> searchForMoveout(String key, String value) {
        if(value.isEmpty()) return this.studentDao.moveoutList();
        return this.studentDao.searchForMoveout(key, value);
    }

    @Override
    public List<Student> findByDormitoryId(Integer dormitoryId) {
        return this.studentDao.findByDormitoryId(dormitoryId);
    }
}
