package com.hafidz.entity;

public class Student {
    private String id;
    private String name;
    private String department;
    private int mark;

    public Student(String id, String name, String department, int mark) {
        this.id = id;
        this.name = name;
        this.department = department;
        this.mark = mark;
    }

    public String getStudentID() {
        return id;
    }

    public void setStudentID(String id) {
        this.id = id;
    }

    public String getStudentName() {
        return name;
    }

    public void setStudentName(String name) {
        this.name = name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }
}
