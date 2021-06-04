package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class GlobalUserListItem {

        private Long userid;
        private Long studentId;
        private Long assignedInstructorId;
        private String academic_status;
        private String studentFirstName;
        private String studentLastName;

        private String instructorFirstName;
        private String instructorLastName;
        private Long instructorId;
        private List<Quiz> studentQuizes;
        private List<Integer> quizIds;

        private List<QuizScoreSummary> quizScoreSummaries;
        private List<Homework> homeworkSummaries;
        private List<Pathway> pathwaySummaries;

        private Integer quizAverage;
        private Integer hwAverage;



        public GlobalUserListItem(Long userid, String username, Long studentId, Long assignedInstructorId, String academic_status, String studentFirstName, String studentLastName, String instructorFirstName, String instructorLastName, Long instructorId) {
            this.userid = userid;
            this.studentId = studentId;
            this.assignedInstructorId = assignedInstructorId;
            this.academic_status = academic_status;
            this.studentFirstName = studentFirstName;
            this.studentLastName = studentLastName;
            this.instructorFirstName = instructorFirstName;
            this.instructorLastName = instructorLastName;
            this.instructorId = instructorId;
        }

        public GlobalUserListItem() {
        }

    public List<Pathway> getPathwaySummaries() {
        return pathwaySummaries;
    }

    public void setPathwaySummaries(List<Pathway> pathwaySummaries) {
        this.pathwaySummaries = pathwaySummaries;
    }

    public List<Homework> getHomeworkSummaries() {
        return homeworkSummaries;
    }

    public void setHomeworkSummaries(List<Homework> homeworkSummaries) {
        this.homeworkSummaries = homeworkSummaries;
    }

    public List<Integer> getQuizIds() {
        return quizIds;
    }

    public void setQuizIds(List<Integer> quizIds) {
        this.quizIds = quizIds;
    }

    public List<QuizScoreSummary> getQuizScoreSummaries() {
        return quizScoreSummaries;
    }

    public void setQuizScoreSummaries(List<QuizScoreSummary> quizScoreSummaries) {
        this.quizScoreSummaries = quizScoreSummaries;
    }

    public Long getUserid() {
            return userid;
        }

        public void setUserid(Long userid) {
            this.userid = userid;
        }

        public Long getStudentId() {
            return studentId;
        }

        public void setStudentId(Long studentId) {
            this.studentId = studentId;
        }

        public Long getAssignedInstructorId() {
            return assignedInstructorId;
        }

        public void setAssignedInstructorId(Long assignedInstructorId) {
            this.assignedInstructorId = assignedInstructorId;
        }

        public String getAcademic_status() {
            return academic_status;
        }

        public void setAcademic_status(String academic_status) {
            this.academic_status = academic_status;
        }

        public String getStudentFirstName() {
            return studentFirstName;
        }

        public void setStudentFirstName(String studentFirstName) {
            this.studentFirstName = studentFirstName;
        }

        public String getStudentLastName() {
            return studentLastName;
        }

        public void setStudentLastName(String studentLastName) {
            this.studentLastName = studentLastName;
        }

        public String getInstructorFirstName() {
            return instructorFirstName;
        }

        public void setInstructorFirstName(String instructorFirstName) {
            this.instructorFirstName = instructorFirstName;
        }

        public String getInstructorLastName() {
            return instructorLastName;
        }

        public void setInstructorLastName(String instructorLastName) {
            this.instructorLastName = instructorLastName;
        }

        public Long getInstructorId() {
            return instructorId;
        }

        public void setInstructorId(Long instructorId) {
            this.instructorId = instructorId;
        }

    public List<Quiz> getStudentQuizes() {
        return studentQuizes;
    }

    public void setStudentQuizes(List<Quiz> studentQuizes) {
        this.studentQuizes = studentQuizes;
    }

    public Integer getQuizAverage() {
        return quizAverage;
    }

    public void setQuizAverage(Integer quizAverage) {
        this.quizAverage = quizAverage;
    }

    public Integer getHwAverage() {
        return hwAverage;
    }

    public void setHwAverage(Integer hwAverage) {
        this.hwAverage = hwAverage;
    }

    @Override
    public String toString() {
        return "GlobalUserListItem{" +
                "userid=" + userid +
                ", studentId=" + studentId +
                ", assignedInstructorId=" + assignedInstructorId +
                ", academic_status='" + academic_status + '\'' +
                ", studentFirstName='" + studentFirstName + '\'' +
                ", studentLastName='" + studentLastName + '\'' +
                ", instructorFirstName='" + instructorFirstName + '\'' +
                ", instructorLastName='" + instructorLastName + '\'' +
                ", instructorId=" + instructorId +
                '}';
    }
}