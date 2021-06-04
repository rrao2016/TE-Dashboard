package com.techelevator.model;

public class Student {

    private Long student_id;
    private String firstName;
    private String lastName;
    private Long user_id;
    private Long instructor_id;

    public Student(String firstName, String lastName, Long user_id, Long student_id,Long instructor_id) {
        this.user_id = user_id;
        this.student_id = student_id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.instructor_id = instructor_id;
    }

    public Student(){}

    public Long getInstructor_id() {
        return instructor_id;
    }

    public void setInstructor_id(Long instructor_id) {
        this.instructor_id = instructor_id;
    }

    public Long getStudent_id() {
        return student_id;
    }

    public void setStudent_id(Long student_id) {
        this.student_id = student_id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Student{" +
                "student_id=" + student_id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", user_id=" + user_id +
                ", instructor_id=" + instructor_id +
                '}';
    }
}
