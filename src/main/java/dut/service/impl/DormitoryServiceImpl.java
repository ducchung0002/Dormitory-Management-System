package dut.service.impl;

import dut.dao.DormitoryDao;
import dut.dao.StudentDao;
import dut.dao.impl.DormitoryDaoImpl;
import dut.dao.impl.StudentDaoImpl;
import dut.entity.Dormitory;
import dut.service.DormitoryService;

import java.util.List;

public class DormitoryServiceImpl implements DormitoryService {

    private final DormitoryDao dormitoryDao = new DormitoryDaoImpl();
    private final StudentDao studentDao = new StudentDaoImpl();

    @Override
    public List<Dormitory> availableList() {
        return this.dormitoryDao.availableList();
    }

    @Override
    public List<Dormitory> list() {
        return this.dormitoryDao.list();
    }

    @Override
    public List<Dormitory> search(String key, String value) {
        if(value.isEmpty()) return this.dormitoryDao.list();
        return this.dormitoryDao.search(key, value);
    }

    @Override
    public void save(Dormitory dormitory) {
        Integer save = this.dormitoryDao.save(dormitory);
        if(save != 1) throw new RuntimeException("Error");
    }

    @Override
    public void update(Dormitory dormitory) {
        Integer update = this.dormitoryDao.update(dormitory);
        if(update != 1) throw new RuntimeException("Error");
    }

    @Override
    public void delete(Integer id) {
        List<Integer> studentIdList = this.studentDao.findStudentIdByDormitoryId(id);
        for (Integer studentId : studentIdList) {
            Integer availableId = this.dormitoryDao.availableId();
            Integer updateDorimtory = this.studentDao.updateDorimtory(studentId, availableId);
            Integer subAvailable = this.dormitoryDao.subAvailable(availableId);
            if(updateDorimtory != 1 || subAvailable != 1) throw new RuntimeException("Error");
        }
        Integer delete = this.dormitoryDao.deleteById(id);
        if(delete != 1) throw new RuntimeException("Error");
    }

    @Override
    public List<Dormitory> findByBuildingId(Integer buildingId) {
        return this.dormitoryDao.findByBuildingId(buildingId);
    }
}
