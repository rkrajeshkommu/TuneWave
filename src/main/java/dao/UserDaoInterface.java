package dao;

import model.User;

public interface UserDaoInterface {

	boolean register(User user);

	User login(String usernameOrEmail, String password);

	boolean isUsernameExists(String username);

	boolean isEmailExists(String email);
}
