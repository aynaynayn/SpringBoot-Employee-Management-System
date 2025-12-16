
# Employee Management System

**Spring Boot + JPA + FreeMarker**

## Overview

This project is a **web-based Employee Management System** built using **Spring Boot**, **Spring Data JPA**, **FreeMarker templates**, and **MySQL**.
It supports basic **CRUD operations** for:

* Employees
* Departments
* Attendance records

The system follows a **clear separation of concerns** between backend logic and frontend rendering, ensuring maintainability and consistency across all pages.

---

## System Architecture

The application follows a **layered architecture**:

```
Controller → Service → Repository → Database
        ↓
     FreeMarker Views (FTLH)
```

### 1. Controllers

* **WebController**

  * Handles page navigation and view rendering
  * Supplies data to FreeMarker templates using `Model`
  * Enforces access rules (CRUD pages can only be accessed from list pages)

* **REST Controllers**

  * `EmployeeRestController`
  * `DepartmentRestController`
  * `AttendanceRestController`
  * Handle API-style CRUD operations (POST, PUT, DELETE)

---

### 2. Services

Each entity has a service layer responsible for **business logic**:

* `EmployeeService`
* `DepartmentService`
* `AttendanceService`

Responsibilities:

* Fetch data from repositories
* Validate entity existence
* Centralize logic so controllers remain clean

Interfaces (`IEmployeeService`, etc.) are used to enforce consistency and support scalability.

---

### 3. Repositories

Repositories extend `JpaRepository`:

* `EmployeeRepository`
* `DepartmentRepository`
* `AttendanceRepository`

Responsibilities:

* Handle all database interactions
* Automatically provide CRUD operations
* Support custom queries when needed

---

## Data Models & Relationships

### Employee

* Belongs to **one Department**
* Has **many Attendance records**

```java
@ManyToOne
@JoinColumn(name = "department_id")
private Department department;

@OneToMany(mappedBy = "employee")
private List<Attendance> attendanceRecords;
```

---

### Department

* Can have **many Employees**

```java
@OneToMany(mappedBy = "department")
private List<Employee> employees;
```

---

### Attendance

* Belongs to **one Employee**
* Stores date and attendance status

```java
@ManyToOne
@JoinColumn(name = "employee_id")
private Employee employee;
```

---

### Relationship Summary

| Entity                | Relationship |
| --------------------- | ------------ |
| Department → Employee | One-to-Many  |
| Employee → Attendance | One-to-Many  |
| Attendance → Employee | Many-to-One  |

All models are connected using **JPA annotations**, ensuring referential integrity.

---

## Navigation & Access Control Logic

### Dashboard

* Entry point of the system
* Links to:

  * Employee List
  * Department List
  * Attendance Log

URL:

```
/dashboard
```

---

### List Pages (Main Access Points)

CRUD operations **must start from list pages**:

| Page            | URL                 |
| --------------- | ------------------- |
| Employee List   | `/employees/list`   |
| Department List | `/departments/list` |
| Attendance Log  | `/attendance/list`  |

When a list page is accessed, a session flag (`fromList`) is set.

---

### CRUD Access Restriction

To prevent users from accessing forms directly via URL:

* Add, Edit, and View pages are only accessible **after visiting a list page**
* Otherwise, users are redirected back to the list

This logic is enforced using:

```java
private boolean canAccess(HttpSession session)
```

This ensures:

* Proper user flow
* No orphaned page access
* Clean navigation logic

---

## Frontend (FreeMarker Templates)

### Template Files

Each entity has:

* List page
* View page
* Add page
* Edit page

Examples:

```
listEmployees.ftlh
addEmployee.ftlh
editEmployee.ftlh
viewEmployee.ftlh
```

---

### CSS Structure

The project uses **shared and role-based CSS files** for consistency:

| CSS File     | Purpose                               |
| ------------ | ------------------------------------- |
| `main.css`   | Global layout, typography, navigation |
| `list.css`   | Tables and list pages                 |
| `view.css`   | View-only pages                       |
| `add.css`    | Add forms                             |
| `update.css` | Edit/update forms                     |

Each FreeMarker template includes:

* `main.css` always
* One additional CSS file depending on the page type

This ensures:

* Visual consistency
* Easy maintenance
* Minimal duplication

---

## Database Configuration

Configured in `application.properties`:

* Uses MySQL
* Hibernate auto-updates schema
* JPA manages table creation

The database **must exist** before running the application.

---




