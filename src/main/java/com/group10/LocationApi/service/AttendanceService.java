package com.group10.LocationApi.service;

import com.group10.LocationApi.model.Attendance;
import com.group10.LocationApi.model.Employee;
import com.group10.LocationApi.repository.AttendanceRepository;
import com.group10.LocationApi.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttendanceService implements IAttendanceService {

    @Autowired
    private AttendanceRepository attendanceRepository;

    @Autowired
    private EmployeeRepository employeeRepository;

    @Override
    public List<Attendance> getAllAttendance() {
        return attendanceRepository.findAll();
    }

    @Override
    public Attendance getAttendanceById(Long id) {
        return attendanceRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Attendance record not found with id " + id));
    }

    @Override
    public Attendance saveAttendance(Attendance attendance) {
        if (attendance.getEmployee() != null && attendance.getEmployee().getId() != null) {
            Employee emp = employeeRepository.findById(attendance.getEmployee().getId())
                    .orElseThrow(() -> new RuntimeException("Employee not found"));
            attendance.setEmployee(emp);
        }
        return attendanceRepository.save(attendance);
    }

    @Override
    public Attendance updateAttendance(Long id, Attendance updatedAttendance) {
        Attendance existing = getAttendanceById(id);
        existing.setDate(updatedAttendance.getDate());
        existing.setStatus(updatedAttendance.getStatus());

        if (updatedAttendance.getEmployee() != null && updatedAttendance.getEmployee().getId() != null) {
            Employee emp = employeeRepository.findById(updatedAttendance.getEmployee().getId())
                    .orElseThrow(() -> new RuntimeException("Employee not found"));
            existing.setEmployee(emp);
        }

        return attendanceRepository.save(existing);
    }

    @Override
    public void deleteAttendance(Long id) {
        attendanceRepository.deleteById(id);
    }
}
