package com.vegefood.service;

import com.vegefood.model.AccountModel;
import com.vegefood.model.UserModel;
import java.util.List;

public interface ISignupService {
    List<AccountModel> checkAccountExist(String userName);
    Long signUpAccount(AccountModel account, UserModel user);
}
