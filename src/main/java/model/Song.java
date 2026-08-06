package model;

public class Song {
	private int id;
	private String title;
	private String artist;
	private String album;
	private String genre;
	private String coverImage;
	private String audioFile;
	private String createdAt;

	public Song() {

	}

	public Song(String title, String artist, String album, String genre, String coverImage, String audioFile) {
		this.title = title;
		this.artist = artist;
		this.album = album;
		this.genre = genre;
		this.coverImage = coverImage;
		this.audioFile = audioFile;
	}

	public Song(int id, String title, String artist, String album, String genre, String coverImage, String audioFile,
			String createdAt) {
		this.id = id;
		this.title = title;
		this.artist = artist;
		this.album = album;
		this.genre = genre;
		this.coverImage = coverImage;
		this.audioFile = audioFile;
		this.createdAt = createdAt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(String coverImage) {
		this.coverImage = coverImage;
	}

	public String getAudioFile() {
		return audioFile;
	}

	public void setAudioFile(String audioFile) {
		this.audioFile = audioFile;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

}
