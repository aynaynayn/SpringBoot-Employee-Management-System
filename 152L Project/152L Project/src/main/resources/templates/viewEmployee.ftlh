<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Employee - Employee Management System</title>
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
            padding: 1.5rem 0;
            text-align: center;
            font-weight: 600;
            font-size: 1.8rem;
        }

        .main-content {
            background-color: #f9f9fb;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            max-width: 1100px;
            margin: 2rem auto;
            padding: 2rem 3rem;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            border-bottom: 2px solid #e0e6f5;
            padding-bottom: 0.5rem;
        }

        .section-header h2 {
            color: #34495e;
            font-weight: 700;
        }

        .btn {
            border-radius: 30px;
            font-weight: 500;
            padding: 0.6rem 1.4rem;
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

        /* Employee details */
        .details-card {
            background: #fff;
            border-radius: 10px;
            padding: 1.5rem 2rem;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
            margin-bottom: 2rem;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.75rem 0;
            border-bottom: 1px solid #eceff4;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            font-weight: 600;
            color: #4b5563;
        }

        .detail-value {
            color: #374151;
        }

        /* Attendance Table */
        .section-subheader {
            font-weight: 600;
            color: #334155;
            margin-bottom: 1rem;
        }

        .table-container {
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }

        table {
            width: 100%;
        }

        thead {
            background: #2c3e50;
            color: white;
        }

        td, th {
            padding: 1rem;
            text-align: left;
        }

        tbody tr:hover {
            background-color: #f8fafc;
        }

        .status-badge {
            display: inline-block;
            padding: 0.4rem 0.9rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.85rem;
        }

        .status-present {
            background: #e8f5e9;
            color: #27ae60;
        }

        .status-absent {
            background: #fdecea;
            color: #e74c3c;
        }

        .status-late {
            background: #fff3cd;
            color: #f39c12;
        }

        .footer {
            text-align: center;
            color: white;
            margin-top: 3rem;
            padding: 2rem 0;
            font-size: 0.95rem;
        }

        @media (max-width: 768px) {
            .section-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .btn {
                width: 100%;
                margin-top: 0.5rem;
            }

            .detail-row {
                flex-direction: column;
                align-items: flex-start;
            }

            .detail-label {
                margin-bottom: 0.25rem;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        Employee Management System
    </header>

    <div class="main-content">
        <div class="section-header">
            <h2><i class="fas fa-user me-2"></i>Employee Details</h2>
            <div>
                <a href="/employees/list" class="btn btn-outline-secondary me-2">
                    <i class="fas fa-arrow-left me-1"></i> Back to List
                </a>
            </div>
        </div>

        <#if employee??>
            <div class="details-card">
                <div class="detail-row"><div class="detail-label"><i class="fas fa-id-badge me-2"></i>ID:</div><div class="detail-value">${employee.id}</div></div>
                <div class="detail-row"><div class="detail-label"><i class="fas fa-user me-2"></i>Name:</div><div class="detail-value">${employee.name}</div></div>
                <div class="detail-row"><div class="detail-label"><i class="fas fa-envelope me-2"></i>Email:</div><div class="detail-value">${employee.email}</div></div>
                <div class="detail-row"><div class="detail-label"><i class="fas fa-briefcase me-2"></i>Position:</div><div class="detail-value">${employee.position}</div></div>
                <div class="detail-row"><div class="detail-label"><i class="fas fa-building me-2"></i>Department:</div><div class="detail-value">${employee.department.name!''}</div></div>
                <div class="detail-row"><div class="detail-label"><i class="fas fa-calendar-alt me-2"></i>Date Hired:</div><div class="detail-value">${employee.dateHired}</div></div>
            </div>

            <#if employee.attendanceRecords?? && employee.attendanceRecords?has_content>
                <div class="section-subheader"><i class="fas fa-clipboard-check me-2"></i>Attendance Records</div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr><th>Date</th><th>Status</th><th>Action</th></tr>
                        </thead>
                        <tbody>
                            <#list employee.attendanceRecords as attendance>
                                <#if attendance??>
                                    <tr>
                                        <td>${attendance.date!''}</td>
                                        <td>
                                            <#if attendance.status == 'Present'>
                                                <span class="status-badge status-present">Present</span>
                                            <#elseif attendance.status == 'Absent'>
                                                <span class="status-badge status-absent">Absent</span>
                                            <#elseif attendance.status == 'Late'>
                                                <span class="status-badge status-late">Late</span>
                                            <#else>
                                                <span class="status-badge">${attendance.status!''}</span>
                                            </#if>
                                        </td>
                                        <td>
                                            <#if attendance.id??>
                                                <a href="/attendance/view/${attendance.id}" class="btn btn-sm btn-outline-secondary">View</a>
                                            <#else>
                                                <span class="text-muted">N/A</span>
                                            </#if>
                                        </td>
                                    </tr>
                                </#if>
                            </#list>
                        </tbody>
                    </table>
                </div>
            <#else>
                <div class="alert alert-warning mt-3">
                    <i class="fas fa-info-circle me-2"></i>No attendance records available for this employee.
                </div>
            </#if>
        <#else>
            <div class="alert alert-warning">
                <i class="fas fa-exclamation-circle me-2"></i>No employee data found.
            </div>
        </#if>
    </div>

    <footer class="footer">
        <p>&copy; 2025 Employee Management System. All rights reserved.</p>
        <p>Streamlining workforce management for modern businesses</p>
    </footer>
</body>
</html>
