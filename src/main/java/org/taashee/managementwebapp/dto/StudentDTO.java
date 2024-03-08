package org.taashee.managementwebapp.dto;

import org.springframework.format.annotation.DateTimeFormat;
import org.taashee.managementwebapp.entity.Course;
import org.taashee.managementwebapp.entity.Student;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class StudentDTO {
    private String name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOfBirth;
    private Character Gender;
    private String email;
    private Set<Course> courses = new HashSet<>();

    public StudentDTO( ){

    }
    public StudentDTO(String name, Date dateOfBirth, Character gender, String email, Set<Course> courses) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        Gender = gender;
        this.email = email;
        this.courses = courses;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Character getGender() {
        return Gender;
    }

    public void setGender(Character gender) {
        Gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<Course> getCourses() {
        return courses;
    }

    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }


}
