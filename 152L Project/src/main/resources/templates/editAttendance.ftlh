<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Attendance - Employee Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #2c3e50;
        }

        .header {
            color: white;
            text-align: center;
            padding: 1.5rem 0;
            font-size: 1.8rem;
            font-weight: 600;
        }

        .form-card {
            background: #fff;
            border-radius: 12px;
            padding: 2rem 2.5rem;
            max-width: 700px;
            margin: 2rem auto;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        h2 {
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 1.5rem;
            border-bottom: 2px solid #e0e6f5;
            padding-bottom: 0.5rem;
        }

        label {
            font-weight: 600;
            color: #4b5563;
            margin-top: 1rem;
        }

        select, input {
            border-radius: 8px !important;
            padding: 0.6rem !important;
        }

        .btn {
            border-radius: 30px;
            padding: 0.7rem 1.5rem;
            font-weight: 600;
        }

        .btn-outline-secondary {
            border-color: #d1d5db;
            color: #374151;
        }

        .btn-outline-secondary:hover {
            background-color: #f3f4f6;
        }

        .btn-primary {
            background: linear-gradient(135deg, #3498db, #2c3e50);
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #2c3e50, #3498db);
        }

        .footer {
            text-align: center;
            color: white;
            margin-top: 3rem;
            padding: 2rem 0;
            font-size: 0.95rem;
        }
    </style>
</head>
<body>

<header class="header">
    Employee Management System
</header>

<div class="form-card">
    <h2><i class="fas fa-calendar-check me-2"></i>Edit Attendance</h2>
    <form action="/attendance/update/${attendance.id}" method="post">
        <div class="mb-3">
            <label>Employee:</label>
            <select name="employee.id" class="form-select" required>
                <#list employees as emp>
                    <option value="${emp.id}" <#if attendance.employee.id == emp.id>selected</#if>>${emp.name}</option>
                </#list>
            </select>
        </div>

        <div class="mb-3">
            <label>Date:</label>
            <input type="date" name="date" value="${attendance.date}" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Status:</label>
            <select name="status" class="form-select" required>
                <option value="Present" <#if attendance.status == 'Present'>selected</#if>>Present</option>
                <option value="Absent" <#if attendance.status == 'Absent'>selected</#if>>Absent</option>
                <option value="Late" <#if attendance.status == 'Late'>selected</#if>>Late</option>
            </select>
        </div>

        <div class="d-flex justify-content-between mt-4">
            <a href="/attendance/list" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-1"></i>Back to List</a>
            <button type="submit" class="btn btn-primary"><i class="fas fa-save me-1"></i>Save Changes</button>
        </div>
    </form>
</div>

<footer class="footer">
    &copy; 2025 Employee Management System. All rights reserved.<br>
    Streamlining workforce management for modern businesses
</footer>

</body>
</html>
