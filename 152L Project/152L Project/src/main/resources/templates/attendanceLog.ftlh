<!DOCTYPE html>
<html lang="en">
<head>
    <title>Attendance Log - Employee Record Management</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --border-radius: 12px;
            --shadow: 0 4px 6px rgba(0,0,0,0.1);
            --shadow-lg: 0 10px 25px rgba(0,0,0,0.15);
            --transition: all 0.3s ease;
            --light-bg: rgba(255,255,255,0.95);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #333;
            min-height: 100vh;
        }

        .hero-section {
            text-align: center;
            color: white;
            padding: 4rem 2rem 2rem;
        }

        .hero-section h1 {
            font-size: 3rem;
            font-weight: 700;
        }

        .hero-section p {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .content-box {
            background: var(--light-bg);
            border-radius: var(--border-radius);
            padding: 2.5rem;
            margin: 2rem auto;
            max-width: 1200px;
            box-shadow: var(--shadow-lg);
        }

        .table-container { overflow-x: auto; }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 10px;
        }

        thead tr {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
        }

        th, td {
            text-align: center;
            padding: 1rem;
            border: none;
        }

        td {
            background: white;
            border-radius: 8px;
            box-shadow: var(--shadow);
        }

        .badge {
            font-size: 0.85rem;
            padding: 0.5em 1em;
            border-radius: 50px;
        }

        .actions .btn {
            margin: 0 3px;
            font-size: 0.9rem;
        }

        .add-btn, .back-btn {
            display: inline-block;
            border: none;
            border-radius: 50px;
            padding: 0.8rem 2rem;
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
            color: white;
        }

        .add-btn {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        }

        .back-btn {
            background: linear-gradient(135deg, #6c757d, #343a40);
        }

        .add-btn:hover, .back-btn:hover {
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            transform: translateY(-2px);
            color: white;
        }

        .footer {
            color: white;
            text-align: center;
            padding: 2rem;
            margin-top: 2rem;
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
            border-top: 1px solid rgba(255,255,255,0.2);
        }
    </style>
</head>
<body>

<div class="hero-section">
    <h1>Attendance Management</h1>
    <p>Track and monitor employee attendance records efficiently</p>
</div>

<div class="content-box">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <a href="/index.html" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Home</a>
        <h2 class="mb-0">Attendance Records</h2>
        <a href="/attendance/add" class="add-btn"><i class="fas fa-plus-circle"></i> Record Attendance</a>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <#if attendance?? && attendance?has_content>
                    <#list attendance as record>
                    <tr>
                        <td>${record.id}</td>
                        <td>${record.employee.name!''}</td>
                        <td>${record.date}</td>
                        <td>
                            <#if record.status == 'Present'>
                                <span class="badge bg-success">Present</span>
                            <#elseif record.status == 'Absent'>
                                <span class="badge bg-danger">Absent</span>
                            <#elseif record.status == 'Late'>
                                <span class="badge bg-warning text-dark">Late</span>
                            <#else>
                                <span class="badge bg-secondary">${record.status}</span>
                            </#if>
                        </td>
                        <td class="actions">
                            <a href="/attendance/view/${record.id}" class="btn btn-info btn-sm"><i class="fas fa-eye"></i> View</a>
                            <a href="/attendance/edit/${record.id}" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                            <a href="/attendance/delete/${record.id}" class="btn btn-danger btn-sm"
                               onclick="return confirm('Are you sure you want to delete this attendance record?')">
                               <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </td>
                    </tr>
                    </#list>
                <#else>
                    <tr><td colspan="5" class="text-center">No attendance records found.</td></tr>
                </#if>
            </tbody>
        </table>
    </div>
</div>

<footer class="footer">
    <p>&copy; 2025 Employee Record Management System. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
