/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.service;

public interface IPageService {
    int setBeginIndexProcduct(String page, int numberOfProductInPage);
    int setEndIndexProcduct(String page, int numberOfProductInPage);
}
