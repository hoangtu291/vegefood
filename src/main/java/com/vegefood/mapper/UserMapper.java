package com.vegefood.mapper;

import com.vegefood.model.UserModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<UserModel> {
    @Override
    public UserModel mapRow(ResultSet resultSet) {
        try {
            UserModel user = new UserModel();
            user.setId(resultSet.getLong("id"));
            user.setFullName(resultSet.getString("fullname"));
            user.setAddress(resultSet.getString("address"));
            user.setPhone(resultSet.getString("phone"));
            return user;
        } catch (SQLException e) {
            return null;
        }
    }
}
