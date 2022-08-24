package com.vegefood.dao.impl;

import com.vegefood.dao.ISigninDAO;
import com.vegefood.mapper.AccountMapper;
import com.vegefood.mapper.UserMapper;
import com.vegefood.model.AccountModel;
import com.vegefood.model.UserModel;
import java.util.List;

public class SigninDAO extends AbstractDAO<AccountModel> implements ISigninDAO  {

    @Override
    public List<AccountModel> getAccount(String userName, String password) {
        String sql = "select * from account where username = ? and password = ?";
        return query(sql, new AccountMapper(), userName, password);
    }
    
    @Override
    public List<UserModel> getUserByAccount(Long userId) {
        String sql = "select * from user where id = ?";
        return query(sql, new UserMapper(), userId);
    }
    
//    public static void main(String[] args) {
//        SigninDAO detail = new SigninDAO();
//        List<UserModel> list = detail.getUserByAccount(1L);
//        System.out.println(list.get(0).getFullName());
//    }

    
}
