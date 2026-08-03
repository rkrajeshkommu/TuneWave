package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.User;
import utility.DBConnection;

public class UserDao implements UserDaoInterface {

	@Override
	public boolean register(User user) {
		boolean status = false;
		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("insert into users(first_name,last_name,username,email,password,role) values(?,?,?,?,?,?)")) {
			
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
	public boolean isUsernameExists(String username) {
		boolean status = false;
		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("select count(*) from users where username = ?")) {
			
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
				PreparedStatement ps = con.prepareStatement("select count(*) from users where email = ?")) {
			
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

	@Override
	public User login(String usernameOrEmail, String password) {
		User user = null;
		try (Connection con = DBConnection.getConnection(); 
				PreparedStatement ps = con.prepareStatement("select * from users where username = ? or email = ? and password = ?")) {

			ps.setString(1, usernameOrEmail);
			ps.setString(2, usernameOrEmail);
			ps.setString(3, password);

			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				user = new User(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"),
						rs.getString("username"), rs.getString("email"), rs.getString("password"), rs.getString("role"),
						rs.getString("created_at"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> users = new ArrayList<>();

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("select * from users order by id desc")) {
			
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				User user = new User(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"),
						rs.getString("username"), rs.getString("email"), rs.getString("password"), rs.getString("role"),
						rs.getString("created_at"));

				users.add(user);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	@Override
	public User getUserById(int id) {
		User user = null;
		try (Connection con = DBConnection.getConnection(); 
				PreparedStatement ps = con.prepareStatement("select * from users where id = ?")) {

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"),
						rs.getString("username"), rs.getString("email"), rs.getString("password"), rs.getString("role"),
						rs.getString("created_at"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean updateUser(User user) {
		boolean status = false;
		try (Connection con = DBConnection.getConnection(); 
				PreparedStatement ps = con.prepareStatement("update users set first_name=?, last_name=?, username=?, email=?, role=? where id=?")) {
			
			ps.setString(1, user.getFirstname());
	        ps.setString(2, user.getLastname());
	        ps.setString(3, user.getUsername());
	        ps.setString(4, user.getEmail());
	        ps.setString(5, user.getRole());
	        ps.setInt(6, user.getId());
	        
	        int rows = ps.executeUpdate();
			status = rows > 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public boolean deleteUser(int id) {
		boolean status = false;
		try (Connection con = DBConnection.getConnection(); 
				PreparedStatement ps = con.prepareStatement("delete from users where id=?")) {

			ps.setInt(1, id);
	        
	        int rows = ps.executeUpdate();
			status = rows > 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

}
