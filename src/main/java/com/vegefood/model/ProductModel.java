/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.model;

public class ProductModel extends AbstractModel {
    
    private String name;
    private double price;
    private String image;
    private int discount;
    private String description;
    private Long categoryid;
    private double priceleft;
    private CategoryModel categoryModel = new CategoryModel();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Long categoryid) {
        this.categoryid = categoryid;
    }

    public double getPriceleft() {
        return priceleft;
    }

    public void setPriceleft(double percent) {
        priceleft = price - (price * percent) / 100;
    }

    public CategoryModel getCategoryModel() {
        return categoryModel;
    }

    public void setCategoryModel(CategoryModel categoryModel) {
        this.categoryModel = categoryModel;
    }
    
}
