<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Department Management - Employee Management System</title>
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
            text-align: center;
            color: white;
            padding: 2rem 0 1rem;
        }

        .header h1 {
            font-weight: 700;
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
        }

        .header p {
            color: #eaeaea;
            font-size: 1rem;
        }

        .main-content {
            background: #f9f9fb;
            border-radius: 15px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
            max-width: 1100px;
            margin: 2rem auto;
            padding: 2rem 3rem;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .section-header h2 {
            color: #2c3e50;
            font-weight: 700;
        }

        .btn {
            border-radius: 30px;
            font-weight: 600;
            padding: 0.6rem 1.4rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, #3498db, #2c3e50);
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #2c3e50, #3498db);
        }

        .btn-outline-secondary {
            border-color: #d1d5db;
            color: #374151;
        }

        .btn-outline-secondary:hover {
            background-color: #f3f4f6;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 0.75rem;
        }

        thead {
            background: linear-gradient(135deg, #3498db, #2c3e50);
            color: white;
        }

        th, td {
            text-align: center;
            padding: 1rem;
        }

        tbody tr {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        tbody tr td:first-child {
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        tbody tr td:last-child {
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .btn-view {
            background-color: #06b6d4;
            color: white;
            border: none;
        }

        .btn-view:hover {
            background-color: #0891b2;
        }

        .btn-edit {
            background-color: #facc15;
            color: #333;
            border: none;
        }

        .btn-edit:hover {
            background-color: #eab308;
        }

        .btn-delete {
            background-color: #ef4444;
            color: white;
            border: none;
        }

        .btn-delete:hover {
            background-color: #dc2626;
        }

        .footer {
            text-align: center;
            color: white;
            margin-top: 3rem;
            padding: 2rem 0;
            font-size: 0.95rem;
        }

        .alert {
            margin-bottom: 1.5rem;
            border-radius: 8px;
        }

        .alert-success {
            background-color: rgba(46, 204, 113, 0.15);
            color: #2e8b57;
            border: 1px solid rgba(46, 204, 113, 0.3);
        }

        .alert-warning {
            background-color: rgba(243, 156, 18, 0.15);
            color: #b36b00;
            border: 1px solid rgba(243, 156, 18, 0.3);
        }

        @media (max-width: 768px) {
            .section-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }

            .btn {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>Department Management</h1>
        <p>Organize and manage all departments efficiently</p>
    </header>

    <div class="main-content">
        <div class="section-header">
            <h2>Departments</h2>
            <div class="d-flex flex-wrap gap-2">
                <a href="/" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Back to Home
                </a>
                <a href="/departments/add" class="btn btn-primary">
                    <i class="fas fa-plus me-1"></i> Add Department
                </a>
            </div>
        </div>


        <#if errorMessage??>
            <div class="alert alert-warning text-center">${errorMessage}</div>
        </#if>
        <#if successMessage??>
            <div class="alert alert-success text-center">${successMessage}</div>
        </#if>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Department Name</th>
                    <th>Employee Count</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <#list departments as dept>
                    <tr>
                        <td>${dept.id}</td>
                        <td>${dept.name}</td>
                        <td>${dept.employeeCount!0}</td> <!-- Safe: avoids null error -->
                        <td>
                            <a href="/departments/view/${dept.id}" class="btn btn-sm btn-view">
                                <i class="fas fa-eye"></i> View
                            </a>
                            <a href="/departments/edit/${dept.id}" class="btn btn-sm btn-edit">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <a href="/departments/delete/${dept.id}"
                               class="btn btn-sm btn-delete"
                               onclick="return confirm('Are you sure you want to delete this department?');">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </div>

    <footer class="footer">
        &copy; 2025 Employee Management System. All rights reserved.<br>
        Streamlining workforce management for modern businesses
    </footer>
</body>
</html>
