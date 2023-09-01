<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.hafidz.entity.Student" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 60%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<%
    List<Student> students = new ArrayList<>();
    students.add(new Student("S1", "S1", "DEP1", 35));
    students.add(new Student("S2", "S2", "DEP1", 70));
    students.add(new Student("S3", "S3", "DEP1", 60));
    students.add(new Student("S4", "S4", "DEP1", 90));
    students.add(new Student("S5", "S5", "DEP2", 30));
    students.add(new Student("S6", "S6", "DEP3", 32));
    students.add(new Student("S7", "S7", "DEP3", 70));
    students.add(new Student("S8", "S8", "DEP3", 20));
    Map<String, Map<String, Integer>> studentDataByDepartment = new HashMap<>();
    for (Student student : students) {
        String department = student.getDepartment();
        Map<String, Integer> departmentStudents = studentDataByDepartment.getOrDefault(department, new HashMap<String, Integer>());
        departmentStudents.put(student.getStudentID(), student.getMark());
        studentDataByDepartment.put(department, departmentStudents);
    }
%>

<table>
    <tr>
        <th>Departemen</th>
        <th>Student Id</th>
        <th>Marks</th>
    </tr>
    <% for (Map.Entry<String, Map<String, Integer>> entry : studentDataByDepartment.entrySet()) { %>
    <tr>
        <td rowspan="<%= entry.getValue().size() + 1 %>"><%= entry.getKey() %></td>
    </tr>
    <% int totalStudents = entry.getValue().size(); %>
    <% int passCount = 0; %>
    <% for (Map.Entry<String, Integer> studentEntry : entry.getValue().entrySet()) { %>
    <tr>
        <td><a href="#" onclick="showPopup('<%= studentEntry.getKey() %>')"><%= studentEntry.getKey() %></a></td>
        <td><%= studentEntry.getValue() %></td>
        <% if (studentEntry.getValue() >= 40) { passCount++; } %>
    </tr>
    <% } %>
    <% double passPercentage = (passCount * 100.0) / totalStudents; %>
    <tr>
        <td colspan="2">Pass %:</td>
        <td colspan="2"><%= String.format("%.2f", passPercentage) %> %</td>
    </tr>
    <% } %>
</table>

<script>
    function showPopup(studentId) {
        const student = getStudentById(studentId);
        if (student) {
            const popup = document.getElementById('popup');
            const popupStudentName = document.getElementById('popupStudentName');
            popupStudentName.innerText = 'Student Name: ' + student.studentName;
            popup.style.display = 'block';
        }
    }
    function hidePopup() {
        const popup = document.getElementById('popup');
        popup.style.display = 'none';
    }
    function getStudentById(studentId) {
        const studentList = <%= new Gson().toJson(students) %>;
        return studentList.find(student => student.studentID === studentId);
    }
</script>
</body>
</html>
