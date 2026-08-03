package dao;

import java.util.List;

import model.User;

public interface UserDaoInterface {

	boolean register(User user);

	boolean isUsernameExists(String username);

	boolean isEmailExists(String email);

	User login(String usernameOrEmail, String password);

	List<User> getAllUsers();

	User getUserById(int id);

	boolean updateUser(User user);

	boolean deleteUser(int id);
}
