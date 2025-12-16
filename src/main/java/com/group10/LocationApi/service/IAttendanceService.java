package com.group10.LocationApi.service;

import com.group10.LocationApi.model.Attendance;

import java.util.List;

public interface IAttendanceService {
    List<Attendance> getAllAttendance();

    Attendance saveAttendance(Attendance attendance);

    Attendance getAttendanceById(Long id);

    Attendance updateAttendance(Long id, Attendance attendance);

    void deleteAttendance(Long id);
}
