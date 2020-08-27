
package com.cod.techy.entities;


public class Category {
    
    private int cid;
    private String name;
    private String desciption;

    public Category(int cid, String name, String desciption) {
        this.cid = cid;
        this.name = name;
        this.desciption = desciption;
    }

    public Category() {
    }

    public Category(String name, String desciption) {
        this.name = name;
        this.desciption = desciption;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesciption() {
        return desciption;
    }

    public void setDesciption(String desciption) {
        this.desciption = desciption;
    }
    
    
}
