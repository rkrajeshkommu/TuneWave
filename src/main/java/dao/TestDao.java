package dao;

import model.User;

public class TestDao {

	public static void main(String[] args) {
		UserDao dao = new UserDao();
//		System.out.println(dao.isUsernameExists("admin"));
//		System.out.println(dao.isEmailExists("admin@gmail.com"));

		User user = new User();

		user.setFirstname("Rajesh");
		user.setLastname("Kommu");
		user.setUsername("rajesh");
		user.setEmail("rajesh@gmail.com");
		user.setPassword("123456");
		user.setRole("USER");

		System.out.println(dao.register(user));
	}

}
