package com.vegefood.dao.impl;

import com.vegefood.dao.ISignupDAO;
import com.vegefood.mapper.AccountMapper;
import com.vegefood.model.AccountModel;
import com.vegefood.model.UserModel;
import java.util.List;

public class SignupDAO extends AbstractDAO<AccountModel> implements ISignupDAO {

    @Override
    public List<AccountModel> checkAccountExist(String userName) {
        String sql = "SELECT * FROM account WHERE username = ?";
        return query(sql, new AccountMapper(), userName);
    }

    @Override
    public Long signUpAccount(AccountModel account, UserModel user) {
        String sql = "INSERT INTO account(username, password, userid, cartid) VALUES(?, ?, ?, ?)";
        String sqlUser = "INSERT INTO user(fullname, address, phone) VALUES(?, ?, ?)";
        String sqlCart = "insert into cart(userid) values(?)";
        
        Long userId = insert(sqlUser, user.getFullName(), user.getAddress(), user.getPhone());
        Long cartId = insert(sqlCart, userId);
        
        return insert(sql, account.getUserName(), account.getPassword(), userId, cartId);
    }

//    public static void main(String[] args) {
//        SignupDAO detail = new SignupDAO();
//        UserModel user = new UserModel();
//        AccountModel account = new AccountModel();
//
//        user.setFullName("Hoang Tu");
//        user.setAddress("Soc Trang - Viet Nam");
//        user.setPhone("0353360764");
//        account.setUserName("hoangtu");
//        account.setPassword("tu0764");
//
//        Long list = detail.signUpAccount(account, user);
//
//        System.out.println(list);
//    }

}
