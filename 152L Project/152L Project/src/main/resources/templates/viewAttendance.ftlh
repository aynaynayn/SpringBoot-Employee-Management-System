<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Department - Employee Management System</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* View Department Styles - Glass Morphism Theme */
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
            --border-color: #dee2e6;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.15);
            --border-radius: 12px;
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #ecf0f3;
            min-height: 100vh;
            color: #333;
            line-height: 1.6;
        }

        .header {
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            padding: 1.5rem 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .header h1 {
            font-weight: 600;
            font-size: 2rem;
            margin: 0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .main-content {
            padding: 2rem 0;
        }

        .content-card {
            background: #ecf0f3;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            padding: 2.5rem;
            margin: 0 auto;
            max-width: 1400px;
            box-shadow: 14px 14px 20px #cbced1, -14px -14px 20px white;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid rgba(52, 152, 219, 0.3);
        }

        .section-header h2 {
            color: var(--secondary-color);
            font-weight: 600;
            margin: 0;
            font-size: 1.5rem;
        }

        .action-buttons .btn {
            border-radius: 50px;
            padding: 0.8rem 1.5rem;
            font-weight: 600;
            transition: var(--transition);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            border: 2px solid transparent;
        }

        .btn-outline-secondary {
            background: transparent;
            border-color: var(--secondary-color);
            color: var(--secondary-color);
        }

        .btn-outline-secondary:hover {
            background: var(--secondary-color);
            color: white;
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(52, 152, 219, 0.4);
            color: white;
        }

        /* Department Details Card */
        .details-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(5px);
            border-radius: var(--border-radius);
            padding: 2rem;
            margin-bottom: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: var(--transition);
        }

        .detail-row {
            display: flex;
            padding: 1rem 0;
            border-bottom: 1px solid rgba(222, 226, 230, 0.5);
            align-items: center;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            font-weight: 600;
            color: var(--secondary-color);
            width: 200px;
            flex-shrink: 0;
            font-size: 1.1rem;
        }

        .detail-value {
            color: var(--dark-color);
            flex-grow: 1;
            font-size: 1.1rem;
        }

        .department-id {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 700;
            font-size: 1.2rem;
        }

        .department-name {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--secondary-color);
        }

        .employee-count {
            background: linear-gradient(135deg, var(--success-color), #229954);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 700;
            font-size: 1.3rem;
        }

        /* Section Subheader */
        .section-subheader {
            margin-bottom: 1.5rem;
            padding-left: 1rem;
            border-left: 4px solid var(--primary-color);
        }

        .section-subheader h4 {
            color: var(--secondary-color);
            font-weight: 600;
            margin: 0;
            font-size: 1.5rem;
        }

        /* Table Styles */
        .table-container {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin: 0;
        }

        .data-table thead {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
        }

        .data-table th {
            padding: 1.25rem 1rem;
            text-align: left;
            font-weight: 600;
            color: white;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .data-table tbody tr {
            border-bottom: 1px solid rgba(222, 226, 230, 0.5);
            transition: var(--transition);
        }

        .data-table tbody tr:hover {
            background: rgba(52, 152, 219, 0.08);
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .data-table td {
            padding: 1.25rem 1rem;
            color: var(--dark-color);
            vertical-align: middle;
        }

        .employee-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 0.9rem;
            margin-right: 1rem;
        }

        .employee-info {
            display: flex;
            align-items: center;
        }

        .employee-details {
            display: flex;
            flex-direction: column;
        }

        .employee-name {
            font-weight: 600;
            color: var(--secondary-color);
        }

        .employee-email {
            font-size: 0.9rem;
            color: #6c757d;
        }

        /* Alert Styles */
        .alert {
            border-radius: var(--border-radius);
            border: none;
            padding: 1.5rem 2rem;
            box-shadow: var(--shadow);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(5px);
        }

        .alert-warning {
            background: linear-gradient(135deg, rgba(243, 156, 18, 0.1), rgba(243, 156, 18, 0.2));
            color: #856404;
            border-left: 4px solid var(--warning-color);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            color: #6c757d;
        }

        .empty-icon {
            font-size: 4rem;
            opacity: 0.5;
            margin-bottom: 1rem;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .footer {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            text-align: center;
            padding: 2rem;
            margin-top: 3rem;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .content-card {
                padding: 1.5rem;
                margin: 1rem;
            }

            .section-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }

            .action-buttons {
                width: 100%;
            }

            .action-buttons .btn {
                width: 100%;
                justify-content: center;
                margin-bottom: 0.5rem;
            }

            .detail-row {
                flex-direction: column;
                align-items: flex-start;
            }

            .detail-label {
                width: 100%;
                margin-bottom: 0.5rem;
            }

            .table-container {
                overflow-x: auto;
            }

            .data-table {
                min-width: 600px;
            }

            .employee-info {
                flex-direction: column;
                align-items: flex-start;
            }

            .employee-avatar {
                margin-bottom: 0.5rem;
                margin-right: 0;
            }
        }

        @media (max-width: 480px) {
            .header h1 {
                font-size: 1.5rem;
            }

            .section-header h2 {
                font-size: 1.8rem;
            }

            .details-card {
                padding: 1.5rem;
            }

            .data-table th,
            .data-table td {
                padding: 0.75rem 0.5rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <h1>Employee Management System</h1>
        </div>
    </header>

    <div class="container main-content">
        <div class="content-card">
            <!-- Section Header -->
            <div class="section-header">
                <h2>
                    <i class="fas fa-building me-2"></i>
                    Department Details
                </h2>
                <div class="action-buttons">
                    <a href="/departments/list" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i>
                        Back to List
                    </a>
                    <a href="/departments/edit" class="btn btn-primary ms-2">
                        <i class="fas fa-edit me-1"></i>
                        Edit Department
                    </a>
                </div>
            </div>

            <#if department??>
                <!-- Department Details Card -->
                <div class="details-card">
                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="fas fa-id-card me-2"></i>
                            Department ID:
                        </div>
                        <div class="detail-value department-id">#${department.id}</div>
                    </div>
                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="fas fa-signature me-2"></i>
                            Department Name:
                        </div>
                        <div class="detail-value department-name">${department.name}</div>
                    </div>
                    <div class="detail-row">
                        <div class="detail-label">
                            <i class="fas fa-users me-2"></i>
                            Employee Count:
                        </div>
                        <div class="detail-value employee-count">
                            ${department.employees?size}
                            <span class="text-muted" style="font-size: 1rem;">employees</span>
                        </div>
                    </div>
                </div>

                <!-- Employees in Department Section -->
                <#if department.employees?? && department.employees?has_content>
                    <div class="section-subheader">
                        <h4>
                            <i class="fas fa-user-friends me-2"></i>
                            Employees in this Department
                        </h4>
                    </div>
                    <div class="table-container">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Employee</th>
                                    <th>Position</th>
                                    <th>Email</th>
                                    <th>Date Hired</th>
                                </tr>
                            </thead>
                            <tbody>
                                <#list department.employees as employee>
                                <tr>
                                    <td>
                                        <div class="employee-info">
                                            <div class="employee-avatar">
                                                ${employee.name?substring(0,1)?upper_case}
                                            </div>
                                            <div class="employee-details">
                                                <span class="employee-name">${employee.name}</span>
                                                <span class="employee-email">${employee.email}</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="badge bg-primary">${employee.position}</span>
                                    </td>
                                    <td>${employee.email}</td>
                                    <td>
                                        <i class="fas fa-calendar-alt me-1 text-muted"></i>
                                        ${employee.dateHired}
                                    </td>
                                </tr>
                                </#list>
                            </tbody>
                        </table>
                    </div>
                <#else>
                    <div class="empty-state">
                        <div class="empty-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h4>No Employees in this Department</h4>
                        <p class="mt-2">This department currently has no assigned employees.</p>
                        <a href="/employees/add" class="btn btn-primary mt-3">
                            <i class="fas fa-user-plus me-1"></i>
                            Add New Employee
                        </a>
                    </div>
                </#if>
            <#else>
                <div class="alert alert-warning">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-exclamation-triangle me-3 fs-4"></i>
                        <div>
                            <h5 class="alert-heading mb-2">No Department Data Found</h5>
                            <p class="mb-0">The requested department could not be found or has been removed.</p>
                        </div>
                    </div>
                </div>
            </#if>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2023 Employee Management System. All rights reserved.</p>
            <p>Streamlining workforce management for modern businesses</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>