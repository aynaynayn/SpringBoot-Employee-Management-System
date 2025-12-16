<!DOCTYPE html>
<html lang="en">
<head>
    <title>Employee List - Employee Record Management</title>
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
            max-width: 1300px;
            box-shadow: var(--shadow-lg);
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 10px;
        }

        thead tr {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
        }

        th {
            border: none;
            padding: 1rem;
            text-align: center;
        }

        td {
            background: white;
            padding: 1rem;
            border: none;
            border-radius: 8px;
            text-align: center;
            box-shadow: var(--shadow);
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

        .add-btn:hover {
            box-shadow: 0 6px 15px rgba(52,152,219,0.4);
            color: white;
            transform: translateY(-2px);
        }

        .back-btn {
            background: linear-gradient(135deg, #6c757d, #343a40);
        }

        .back-btn:hover {
            box-shadow: 0 6px 15px rgba(108,117,125,0.4);
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

        @media (max-width: 768px) {
            .hero-section h1 { font-size: 2.2rem; }
            .content-box { padding: 1.5rem; }
            th, td { font-size: 0.9rem; }
        }
    </style>
</head>
<body>

<div class="hero-section">
    <h1>Employee Management</h1>
    <p>View, manage, and organize all employee records</p>
</div>

<div class="content-box">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <a href="/index.html" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Home</a>
        <h2 class="mb-0">Employee List</h2>
        <a href="/employees/add" class="add-btn"><i class="fas fa-plus-circle"></i> Add Employee</a>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee Name</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Position</th>
                    <th>Date Hired</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <#if employees?? && employees?has_content>
                    <#list employees as emp>
                    <tr>
                        <td>${emp.id}</td>
                        <td>${emp.name}</td>
                        <td>${emp.email}</td>
                        <td>${emp.department.name!''}</td>
                        <td>${emp.position}</td>
                        <td>${emp.dateHired}</td>
                        <td class="actions">
                            <a href="/employees/view/${emp.id}" class="btn btn-info btn-sm"><i class="fas fa-eye"></i> View</a>
                            <a href="/employees/edit/${emp.id}" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                            <a href="/employees/delete/${emp.id}" class="btn btn-danger btn-sm"
                               onclick="return confirm('Are you sure you want to delete this employee?')"><i class="fas fa-trash-alt"></i> Delete</a>
                        </td>
                    </tr>
                    </#list>
                <#else>
                    <tr><td colspan="7" class="text-center">No employees found.</td></tr>
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
