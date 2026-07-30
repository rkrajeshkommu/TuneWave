package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import utility.DBConnection;

public class UserDao implements UserDaoInterface {

	private static final String CHECK_USERNAME = "select count(*) from users where username = ?";
	private static final String CHECK_EMAIL = "select count(*) from users where email = ?";
	private static final String REGISTER_USER = "insert into users(first_name,last_name,username,email,password,role) values(?,?,?,?,?,?)";

	@Override
	public boolean register(User user) {
		boolean status = false;
		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(REGISTER_USER)) {
			ps.setString(1, user.getFirstname());
			ps.setString(2, user.getLastname());
	        ps.setString(3, user.getUsername());
	        ps.setString(4, user.getEmail());
	        ps.setString(5, user.getPassword());
	        ps.setString(6, user.getRole());
	        
			int rows = ps.executeUpdate();
			status = rows > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public User login(String usernameOrEmail, String password) {

		return null;
	}

	@Override
	public boolean isUsernameExists(String username) {
		boolean status = false;
		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(CHECK_USERNAME)) {
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = rs.getInt(1) > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public boolean isEmailExists(String email) {
		boolean status = false; 
		try (Connection con = DBConnection.getConnection(); 
				PreparedStatement ps = con.prepareStatement(CHECK_EMAIL)) {
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = rs.getInt(1) > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

}
