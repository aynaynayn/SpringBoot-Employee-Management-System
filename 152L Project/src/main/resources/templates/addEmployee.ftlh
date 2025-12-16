<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add New Employee - Employee Record Management</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --border-radius: 12px;
            --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.15);
            --light-bg: rgba(255,255,255,0.95);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #333;
            min-height: 100vh;
        }

        header {
            text-align: center;
            color: white;
            padding: 2rem 1rem 1rem;
        }

        .main-content {
            background: var(--light-bg);
            border-radius: var(--border-radius);
            padding: 2.5rem;
            margin: 2rem auto;
            max-width: 700px;
            box-shadow: var(--shadow-lg);
        }

        .form-label {
            font-weight: 600;
            color: var(--secondary-color);
        }

        .form-control, .form-select {
            border-radius: 8px;
            border: 1px solid #ccc;
            padding: 0.7rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 50px;
            padding: 0.8rem 2rem;
            font-weight: 600;
        }

        .btn-primary:hover {
            box-shadow: 0 6px 15px rgba(52,152,219,0.4);
        }

        .btn-outline-secondary {
            border-radius: 50px;
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

<header>
    <h1>Employee Record Management</h1>
</header>

<div class="container main-content">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">Add New Employee</h2>
        <a href="/employees/list" class="btn btn-outline-secondary">
            <i class="fas fa-arrow-left"></i> Back to List
        </a>
    </div>

    <form action="/employees/add" method="post">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="form-control" placeholder="Enter employee name" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email Address</label>
            <input type="email" name="email" class="form-control" placeholder="Enter email" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Department</label>
            <select name="department.id" class="form-select" required>
                <option value="">Select Department</option>
                <#list departments as dept>
                    <option value="${dept.id}">${dept.name}</option>
                </#list>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Position</label>
            <input type="text" name="position" class="form-control" placeholder="e.g. Software Engineer" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Date Hired</label>
            <input type="date" name="dateHired" class="form-control" required>
        </div>

        <div class="text-end mt-4">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Save Employee
            </button>
        </div>
    </form>
</div>

<footer class="footer">
    <p class="mb-0">&copy; 2023 Employee Record Management. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
