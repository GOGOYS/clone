package com.callor.todo.persistance;

import java.util.List;

import com.callor.todo.model.UserVO;

public interface UserDao {
	public List<UserVO> selectAll();
	public int insert();
	public int create_table_user();
}
