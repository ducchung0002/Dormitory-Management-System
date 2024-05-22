package dut.service.impl;

import dut.dao.BuildingDao;
import dut.dao.DormitoryDao;
import dut.dao.StudentDao;
import dut.dao.impl.BuildingDaoImpl;
import dut.dao.impl.DormitoryDaoImpl;
import dut.dao.impl.StudentDaoImpl;
import dut.entity.Building;
import dut.service.BuildingService;

import java.util.List;

public class BuildingServiceImpl implements BuildingService {

    private final BuildingDao buildingDao = new BuildingDaoImpl();
    private final DormitoryDao dormitoryDao = new DormitoryDaoImpl();
    private final StudentDao studentDao = new StudentDaoImpl();

    @Override
    public List<Building> list() {
        return this.buildingDao.list();
    }

    @Override
    public List<Building> search(String key, String value) {
        if(value.isEmpty()) return this.buildingDao.list();
        return this.buildingDao.search(key, value);
    }

    @Override
    public void save(Building building) {
        Integer save = this.buildingDao.save(building);
        if(save != 1) throw new RuntimeException("Error");
    }

    @Override
    public void update(Building building) {
        Integer update = this.buildingDao.update(building);
        if(update != 1) throw new RuntimeException("Error");
    }

    @Override
    public void delete(Integer id) {
        List<Integer> dormitoryIdList = this.dormitoryDao.findDormitoryIdByBuildingId(id);
        for (Integer dormitoryId : dormitoryIdList) {
            List<Integer> studentIdList = this.studentDao.findStudentIdByDormitoryId(dormitoryId);
            for (Integer studentId : studentIdList) {
                Integer availableId = this.dormitoryDao.availableId();
                Integer updateDorimtory = this.studentDao.updateDorimtory(studentId, availableId);
                Integer subAvailable = this.dormitoryDao.subAvailable(availableId);
                if(updateDorimtory != 1 || subAvailable != 1) throw new RuntimeException("Error");
            }
        }
        for (Integer dormitoryId : dormitoryIdList) {
            Integer delete = this.dormitoryDao.deleteById(dormitoryId);
            if(delete != 1) throw new RuntimeException("Error");
        }
        // Delete building
        Integer delete = this.buildingDao.delete(id);
        if(delete != 1) throw new RuntimeException("Error");
    }
}
