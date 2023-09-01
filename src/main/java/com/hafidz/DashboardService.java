package com.hafidz;

import com.hafidz.entity.Student;

import java.util.HashMap;
import java.util.Map;

public class DashboardService {

    public static Map<String, Map<String, Integer>> getStudentDataByDepartment() {
        Student student1 = new Student("S1", "Student1", "DEP1", 35);
        Student student2 = new Student("S2", "Student2", "DEP1", 70);
        Student student3 = new Student("S3", "Student3", "DEP1", 60);
        Student student4 = new Student("S4", "Student4", "DEP1", 90);
        Student student5 = new Student("S5", "Student5", "DEP2", 30);
        Student student6 = new Student("S6", "Student6", "DEP3", 32);
        Student student7 = new Student("S7", "Student7", "DEP3", 70);
        Student student8 = new Student("S8", "Student8", "DEP3", 20);

        Map<String, Map<String, Integer>> studentDataByDept = new HashMap<>();
        insertData(studentDataByDept, student1);
        insertData(studentDataByDept, student2);
        insertData(studentDataByDept, student3);
        insertData(studentDataByDept, student4);
        insertData(studentDataByDept, student5);
        insertData(studentDataByDept, student6);
        insertData(studentDataByDept, student7);
        insertData(studentDataByDept, student8);
        return studentDataByDept;
    }

    private static void insertData(Map<String, Map<String, Integer>> studentDataByDept, Student student) {
        if (!studentDataByDept.containsKey(student.getDepartment())) {
            studentDataByDept.put(student.getDepartment(), new HashMap<String, Integer>());
        }
        studentDataByDept.get(student.getDepartment()).put(student.getStudentID(), student.getMark());
    }
}
