package com.techelevator.model;

public class Placement {
    private Long placement_id;
    private String company_name;
    private String street_address;
    private String city;
    private String state;
    private int zipcode;
    private float latitude;
    private float longitude;

    public Placement(Long placement_id, String company_name, String street_address, String city, String state, int zipcode, float latitude, float longitude) {
        this.placement_id = placement_id;
        this.company_name = company_name;
        this.street_address = street_address;
        this.city = city;
        this.state = state;
        this.zipcode = zipcode;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public Placement() {

    }

    public Long getPlacement_id() {
        return placement_id;
    }

    public void setPlacement_id(Long placement_id) {
        this.placement_id = placement_id;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getStreet_address() {
        return street_address;
    }

    public void setStreet_address(String street_address) {
        this.street_address = street_address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getZipcode() {
        return zipcode;
    }

    public void setZipcode(int zipcode) {
        this.zipcode = zipcode;
    }

    public float getLatitude() {
        return latitude;
    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    @Override
    public String toString() {
        return "Placement{" +
                "placement_id=" + placement_id +
                ", company_name='" + company_name + '\'' +
                ", street_address='" + street_address + '\'' +
                ", city='" + city + '\'' +
                ", state='" + state + '\'' +
                ", zipcode=" + zipcode +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                '}';
    }
}
