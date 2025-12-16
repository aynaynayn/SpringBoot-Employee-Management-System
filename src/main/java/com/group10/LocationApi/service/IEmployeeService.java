package com.group10.LocationApi.service;

import com.group10.LocationApi.model.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> getAllEmployees();

    Employee saveEmployee(Employee employee);

    Employee getEmployeeById(Long id);

    Employee updateEmployee(Long id, Employee employee);

    void deleteEmployee(Long id);
}
