package com.vegefood.service.impl;

import com.vegefood.dao.ISigninDAO;
import com.vegefood.model.AccountModel;
import com.vegefood.model.UserModel;
import com.vegefood.service.ISigninService;
import java.util.List;
import javax.inject.Inject;

public class SigninService implements ISigninService {
    
    @Inject
    private ISigninDAO signinDao;

    @Override
    public List<AccountModel> getAccount(String userName, String password) {
        return signinDao.getAccount(userName, password);
    }

    @Override
    public List<UserModel> getUserByAccount(Long userId) {
        return signinDao.getUserByAccount(userId);
    }
    
}
