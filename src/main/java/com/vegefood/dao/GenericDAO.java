package com.vegefood.dao;

import com.vegefood.mapper.RowMapper;
import java.util.List;

public interface GenericDAO<T> {

    <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);
    void update(String sql, Object... parameters);
    Long insert(String sql, Object... parameters);
    
}
