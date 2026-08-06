package controller;

import java.io.File;
import java.io.IOException;

import dao.SongDao;
import dao.SongDaoInterface;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Song;

@WebServlet("/EditSongController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 20 * 1024 * 1024, maxRequestSize = 40 * 1024 * 1024)
public class EditSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		SongDaoInterface dao = new SongDao();

		Song song = dao.getSongById(id);

		request.setAttribute("song", song);
		request.getRequestDispatcher("/admin/edit-song.jsp").forward(request, response);

	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		String title = request.getParameter("title");
		String artist = request.getParameter("artist");
		String album = request.getParameter("album");
		String genre = request.getParameter("genre");
		
		String oldCoverImage = request.getParameter("oldCoverImage");
		String oldAudioFile = request.getParameter("oldAudioFile");
		
		Part coverPart = request.getPart("coverImage");
		Part audioPart = request.getPart("audioFile");
		
		String imageUploadPath = getServletContext().getRealPath("/assets/images/songs");
		String audioUploadPath = getServletContext().getRealPath("/assets/audio/songs");
		
		String coverImage = oldCoverImage;

		if (coverPart.getSize() > 0) {
			String fileName = System.currentTimeMillis() + "_" + coverPart.getSubmittedFileName();
			coverPart.write(imageUploadPath + File.separator + fileName);
			coverImage = fileName;
		}
		
		String audioFile = oldAudioFile;

		if (audioPart.getSize() > 0) {
			String fileName = System.currentTimeMillis() + "_" + audioPart.getSubmittedFileName();
			audioPart.write(audioUploadPath + File.separator + fileName);
			audioFile = fileName;
		}
		
		Song song = new Song();

		song.setId(id);
		song.setTitle(title);
		song.setArtist(artist);
		song.setAlbum(album);
		song.setGenre(genre);
		song.setCoverImage(coverImage);
		song.setAudioFile(audioFile);
		
		SongDaoInterface dao = new SongDao();
		boolean status = dao.updateSong(song);
		
		if (status) {
		    request.getSession().setAttribute("success", "Song updated successfully.");
		} else {
		    request.getSession().setAttribute("error", "Failed to update song.");
		}

		response.sendRedirect(request.getContextPath() + "/admin/songs.jsp");
		
	}

}
