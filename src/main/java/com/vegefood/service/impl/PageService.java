/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.service.impl;

import com.vegefood.service.IPageService;

public class PageService implements IPageService {

    @Override
    public int setBeginIndexProcduct(String page, int numberOfProductInPage) {
        if(page != null){
            int inPage = Integer.parseInt(page);
            return ((inPage - 1) * numberOfProductInPage);
        }
        return 0;
    }

    @Override
    public int setEndIndexProcduct(String page, int numberOfProductInPage) {
        if(page != null){
            int inPage = Integer.parseInt(page);
            return ((inPage - 1) * numberOfProductInPage + (numberOfProductInPage-1));
        }
        return 11;
    }
    
//    public static void main(String[] args) {
//        PageService page = new PageService();
//        for(int i = 1; i<=7; i++){
//            System.out.println(page.setBeginIndexProcduct(i, 12)+" - "+ page.setEndIndexProcduct(i, 12));
//        }
//    }
}
