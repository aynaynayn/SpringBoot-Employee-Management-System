package com.group10.LocationApi.controller;

import com.group10.LocationApi.model.Attendance;
import com.group10.LocationApi.model.Department;
import com.group10.LocationApi.model.Employee;
import com.group10.LocationApi.service.AttendanceService;
import com.group10.LocationApi.service.DepartmentService;
import com.group10.LocationApi.service.EmployeeService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
public class WebController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private AttendanceService attendanceService;

    // Session-based access flag
    private boolean canAccess(HttpSession session) {
        Boolean fromList = (Boolean) session.getAttribute("fromList");
        if (fromList != null && fromList) {
            session.removeAttribute("fromList");
            return true;
        }
        return false;
    }

    // ========================= EMPLOYEES =========================
    @GetMapping("/employees/list")
    public String listEmployees(HttpSession session, Model model) {
        session.setAttribute("fromList", true);
        List<Employee> employees = employeeService.getAllEmployees();
        model.addAttribute("employees", employees);
        return "listEmployees";
    }

    @GetMapping("/employees/add")
    public String addEmployee(Model model) {
        List<Department> departments = departmentService.getAllDepartments();
        model.addAttribute("departments", departments);
        model.addAttribute("employee", new Employee());
        return "addEmployee";
    }

    @PostMapping("/employees/add")
    public String saveEmployee(@ModelAttribute Employee employee) {
        employeeService.saveEmployee(employee);
        return "redirect:/employees/list";
    }

    @GetMapping("/employees/edit/{id}")
    public String editEmployee(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) return "redirect:/employees/list";
        Employee employee = employeeService.getEmployeeById(id);
        List<Department> departments = departmentService.getAllDepartments();
        model.addAttribute("employee", employee);
        model.addAttribute("departments", departments);
        return "editEmployee";
    }

    @PostMapping("/employees/update/{id}")
    public String updateEmployee(@PathVariable Long id, @ModelAttribute Employee employee) {
        employeeService.updateEmployee(id, employee);
        return "redirect:/employees/list";
    }

    @GetMapping("/employees/delete/{id}")
    public String deleteEmployee(@PathVariable Long id) {
        employeeService.deleteEmployee(id);
        return "redirect:/employees/list";
    }

    @GetMapping("/employees/view/{id}")
    public String viewEmployee(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) return "redirect:/employees/list";
        try {
            Employee employee = employeeService.getEmployeeById(id);
            if (employee.getAttendanceRecords() == null)
                employee.setAttendanceRecords(new ArrayList<>());
            model.addAttribute("employee", employee);
        } catch (RuntimeException e) {
            model.addAttribute("error", "Employee not found");
        }
        return "viewEmployee";
    }

    // ========================= DEPARTMENTS =========================
    @GetMapping("/departments/list")
    public String listDepartments(HttpSession session, Model model) {
        session.setAttribute("fromList", true);
        List<Department> departments = departmentService.getAllDepartments();
        model.addAttribute("departments", departments);
        return "listDepartments";
    }

    @GetMapping("/departments/add")
    public String addDepartment(Model model) {
        model.addAttribute("department", new Department());
        return "addDepartment";
    }

    @PostMapping("/departments/add")
    public String saveDepartment(@ModelAttribute Department department) {
        departmentService.saveDepartment(department);
        return "redirect:/departments/list";
    }

    @GetMapping("/departments/edit/{id}")
    public String editDepartment(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) return "redirect:/departments/list";
        Department department = departmentService.getDepartmentById(id);
        model.addAttribute("department", department);
        return "editDepartment";
    }

    @PostMapping("/departments/update/{id}")
    public String updateDepartment(@PathVariable Long id, @ModelAttribute Department department) {
        departmentService.updateDepartment(id, department);
        return "redirect:/departments/list";
    }

    @GetMapping("/departments/delete/{id}")
    public String deleteDepartment(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            departmentService.deleteDepartment(id);
            redirectAttributes.addFlashAttribute("successMessage", "Department deleted successfully.");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        }
        return "redirect:/departments/list";
    }


    @GetMapping("/departments/view/{id}")
    public String viewDepartment(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) return "redirect:/departments/list";
        try {
            Department department = departmentService.getDepartmentById(id);
            model.addAttribute("department", department);
        } catch (RuntimeException e) {
            model.addAttribute("error", "Department not found");
        }
        return "viewDepartment";
    }

    // ========================= ATTENDANCE =========================
    @GetMapping("/attendance/list")
    public String listAttendance(HttpSession session, Model model) {
        session.setAttribute("fromList", true);
        List<Attendance> attendance = attendanceService.getAllAttendance();
        model.addAttribute("attendance", attendance);
        return "attendanceLog";
    }

    @GetMapping("/attendance/add")
    public String addAttendance(Model model) {
        List<Employee> employees = employeeService.getAllEmployees();
        model.addAttribute("employees", employees);
        model.addAttribute("attendance", new Attendance());
        return "recordAttendance";
    }

    @PostMapping("/attendance/add")
    public String saveAttendance(@ModelAttribute Attendance attendance) {
        attendanceService.saveAttendance(attendance);
        return "redirect:/attendance/list";
    }

    @GetMapping("/attendance/edit/{id}")
    public String editAttendance(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) return "redirect:/attendance/list";
        Attendance attendance = attendanceService.getAttendanceById(id);
        List<Employee> employees = employeeService.getAllEmployees();
        model.addAttribute("attendance", attendance);
        model.addAttribute("employees", employees);
        return "editAttendance";
    }

    @PostMapping("/attendance/update/{id}")
    public String updateAttendance(@PathVariable Long id, @ModelAttribute Attendance attendance) {
        attendanceService.updateAttendance(id, attendance);
        return "redirect:/attendance/list";
    }

    @GetMapping("/attendance/delete/{id}")
    public String deleteAttendance(@PathVariable Long id) {
        attendanceService.deleteAttendance(id);
        return "redirect:/attendance/list";
    }

    @GetMapping("/attendance/view/{id}")
    public String viewAttendance(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) return "redirect:/attendance/list";
        try {
            Attendance attendance = attendanceService.getAttendanceById(id);
            model.addAttribute("attendance", attendance);
        } catch (RuntimeException e) {
            model.addAttribute("error", "Attendance record not found");
        }
        return "viewAttendance";
    }
}
