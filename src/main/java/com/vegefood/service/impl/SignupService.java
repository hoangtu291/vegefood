package com.vegefood.service.impl;

import com.vegefood.dao.ISignupDAO;
import com.vegefood.model.AccountModel;
import com.vegefood.model.UserModel;
import com.vegefood.service.ISignupService;
import java.util.List;
import javax.inject.Inject;

public class SignupService implements ISignupService {
    
    @Inject
    private ISignupDAO signupDao;

    @Override
    public List<AccountModel> checkAccountExist(String userName) {
        return signupDao.checkAccountExist(userName);
    }

    @Override
    public Long signUpAccount(AccountModel account, UserModel user) {
        return signupDao.signUpAccount(account, user);
    }
    
}
