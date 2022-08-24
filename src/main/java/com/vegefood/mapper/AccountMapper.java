package com.vegefood.mapper;

import com.vegefood.model.AccountModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountMapper implements RowMapper<AccountModel> {
    
    @Override
    public AccountModel mapRow(ResultSet resultSet) {
        try {
            AccountModel account = new AccountModel();
            account.setId(resultSet.getLong("id"));
            account.setUserName(resultSet.getString("username"));
            account.setPassword(resultSet.getString("password"));
            account.setUserId(resultSet.getLong("userid"));
            return account;
        } catch (SQLException e) {
            return null;
        }
    }
}
