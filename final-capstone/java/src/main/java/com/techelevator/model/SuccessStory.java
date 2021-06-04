package com.techelevator.model;

public class SuccessStory {
    private Long story_id;
    private String first_name;
    private String title;
    private String message;

    public SuccessStory(Long story_id, String first_name, String title, String message) {
        this.story_id = story_id;
        this.first_name = first_name;
        this.title = title;
        this.message = message;
    }

    public SuccessStory() {

    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getStory_id() {
        return story_id;
    }

    public void setStory_id(Long story_id) {
        this.story_id = story_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "SuccessStory{" +
                "story_id=" + story_id +
                ", first_name='" + first_name + '\'' +
                ", title='" + title + '\'' +
                ", message='" + message + '\'' +
                '}';
    }
}
