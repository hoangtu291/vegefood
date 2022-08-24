
package com.vegefood.dao;

import com.vegefood.model.AccountModel;
import com.vegefood.model.UserModel;
import java.util.List;

public interface ISigninDAO {
    
    List<AccountModel> getAccount(String userName, String password);
    List<UserModel> getUserByAccount(Long userId);
}
