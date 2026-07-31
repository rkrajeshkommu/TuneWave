package dao;

import model.User;

public interface UserDaoInterface {

	boolean register(User user);

	boolean isUsernameExists(String username);

	boolean isEmailExists(String email);
	
	User login(String usernameOrEmail, String password);
}
