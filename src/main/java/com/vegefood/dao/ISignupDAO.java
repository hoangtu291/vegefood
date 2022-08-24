package com.vegefood.dao;

import com.vegefood.model.AccountModel;
import com.vegefood.model.UserModel;
import java.util.List;

public interface ISignupDAO {
    
    List<AccountModel> checkAccountExist(String userName);
    Long signUpAccount(AccountModel account, UserModel user);
//    Long insertUser(UserModel user);
}
