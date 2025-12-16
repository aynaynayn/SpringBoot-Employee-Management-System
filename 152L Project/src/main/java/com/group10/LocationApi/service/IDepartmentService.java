package com.group10.LocationApi.service;

import com.group10.LocationApi.model.Department;

import java.util.List;

public interface IDepartmentService {
    List<Department> getAllDepartments();

    Department getDepartmentById(Long id);

    Department saveDepartment(Department department);

    Department updateDepartment(Long id, Department department);

    void deleteDepartment(Long id);
}
