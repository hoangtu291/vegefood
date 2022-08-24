package com.vegefood.service;

import com.vegefood.model.AccountModel;
import com.vegefood.model.UserModel;
import java.util.List;

public interface ISigninService {
    List<AccountModel> getAccount(String userName, String password);
    List<UserModel> getUserByAccount(Long userId);
}
