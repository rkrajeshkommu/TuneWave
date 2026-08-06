package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Song;
import utility.DBConnection;

public class SongDao implements SongDaoInterface {

	@Override
	public boolean addSong(Song song) {
		boolean status = false;
		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(
						"insert into songs(title, artist, album, genre, cover_image, audio_file) values(?,?,?,?,?,?)")) {

			ps.setString(1, song.getTitle());
			ps.setString(2, song.getArtist());
			ps.setString(3, song.getAlbum());
			ps.setString(4, song.getGenre());
			ps.setString(6, song.getCoverImage());
			ps.setString(7, song.getAudioFile());

			int rows = ps.executeUpdate();
			status = rows > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<Song> getAllSongs() {
		List<Song> songs = new ArrayList<>();

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("select * from songs order by id desc")) {
			
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Song song = new Song();
				
				song.setId(rs.getInt("id"));
				song.setTitle(rs.getString("title"));
				song.setArtist(rs.getString("artist"));
				song.setAlbum(rs.getString("album"));
				song.setGenre(rs.getString("genre"));
				song.setCoverImage(rs.getString("cover_image"));
				song.setAudioFile(rs.getString("audio_file"));
				song.setCreatedAt(rs.getString("created_at"));
				
				songs.add(song);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return songs;
	}

	@Override
	public Song getSongById(int id) {
		Song song = null;
		try (Connection con = DBConnection.getConnection(); 
				PreparedStatement ps = con.prepareStatement("select * from songs where id = ?")) {

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				song = new Song();

	            song.setId(rs.getInt("id"));
	            song.setTitle(rs.getString("title"));
	            song.setArtist(rs.getString("artist"));
	            song.setAlbum(rs.getString("album"));
	            song.setGenre(rs.getString("genre"));
	            song.setCoverImage(rs.getString("cover_image"));
	            song.setAudioFile(rs.getString("audio_file"));
	            song.setCreatedAt(rs.getString("created_at"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return song;
	}

	@Override
	public boolean updateSong(Song song) {
		boolean status = false;
		try (Connection con = DBConnection.getConnection(); 
				PreparedStatement ps = con.prepareStatement("update songs set title=?, artist=?, album=?, genre=?, cover_image=?, audio_file=? where id=?")) {
			
			ps.setString(1, song.getTitle());
			ps.setString(2, song.getArtist());
			ps.setString(3, song.getAlbum());
			ps.setString(4, song.getGenre());
			ps.setString(6, song.getCoverImage());
			ps.setString(7, song.getAudioFile());
	        ps.setInt(8, song.getId());
	        
	        int rows = ps.executeUpdate();
			status = rows > 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public boolean deleteSong(int id) {
		boolean status = false;
		try (Connection con = DBConnection.getConnection(); 
				PreparedStatement ps = con.prepareStatement("delete from songs where id=?")) {

			ps.setInt(1, id);
	        
	        int rows = ps.executeUpdate();
			status = rows > 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

}
