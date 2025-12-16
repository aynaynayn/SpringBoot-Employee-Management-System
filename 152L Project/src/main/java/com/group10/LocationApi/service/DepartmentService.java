package com.group10.LocationApi.service;

import com.group10.LocationApi.model.Department;
import com.group10.LocationApi.repository.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService implements IDepartmentService {

    @Autowired
    private DepartmentRepository departmentRepository;

    @Override
    public List<Department> getAllDepartments() {
        return departmentRepository.findAll();
    }

    @Override
    public Department getDepartmentById(Long id) {
        return departmentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Department not found with id " + id));
    }

    @Override
    public Department saveDepartment(Department department) {
        return departmentRepository.save(department);
    }

    @Override
    public Department updateDepartment(Long id, Department updatedDept) {
        Department existing = getDepartmentById(id);
        existing.setName(updatedDept.getName());
        return departmentRepository.save(existing);
    }

    @Override
    public void deleteDepartment(Long id) {
        Department department = departmentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Department not found with id " + id));

        if (department.getEmployees() != null && !department.getEmployees().isEmpty()) {
            throw new RuntimeException(
                    "Cannot delete department because it still has assigned employees."
            );
        }

        departmentRepository.delete(department);
    }

}
