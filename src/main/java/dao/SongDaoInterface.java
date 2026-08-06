package dao;

import java.util.List;

import model.Song;

public interface SongDaoInterface {
	boolean addSong(Song song);

	List<Song> getAllSongs();

	Song getSongById(int id);

	boolean updateSong(Song song);

	boolean deleteSong(int id);
}
