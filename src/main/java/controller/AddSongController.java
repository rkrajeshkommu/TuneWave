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

@WebServlet("/AddSongController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 20 * 1024 * 1024, maxRequestSize = 40 * 1024 * 1024)
public class AddSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		String artist = request.getParameter("artist");
		String album = request.getParameter("album");
		String genre = request.getParameter("genre");

		Part coverPart = request.getPart("coverImage");
		Part audioPart = request.getPart("audioFile");

		String coverFileName = coverPart.getSubmittedFileName();
		String audioFileName = audioPart.getSubmittedFileName();

		String uniqueCoverName = System.currentTimeMillis() + "_" + coverFileName;
		String uniqueAudioName = System.currentTimeMillis() + "_" + audioFileName;

		String imageUploadPath = getServletContext().getRealPath("/assets/images/songs");
		String audioUploadPath = getServletContext().getRealPath("/assets/audio/songs");

		File imageDir = new File(imageUploadPath);
		File audioDir = new File(audioUploadPath);

		if (!imageDir.exists()) {
			imageDir.mkdirs();
		}

		if (!audioDir.exists()) {
			audioDir.mkdirs();
		}

		coverPart.write(imageUploadPath + File.separator + uniqueCoverName);
		audioPart.write(audioUploadPath + File.separator + uniqueAudioName);

		if (coverPart == null || coverPart.getSize() == 0 || audioPart == null || audioPart.getSize() == 0) {
			response.sendRedirect(request.getContextPath() + "/admin/add-song.jsp");
			return;
		}
		
		Song song = new Song(title, artist, album, genre, uniqueCoverName, uniqueAudioName);
		
		SongDaoInterface dao = new SongDao();

		boolean status = dao.addSong(song);
		
		if (status) {
			request.getSession().setAttribute("success", "Song added successfully!");
			response.sendRedirect(request.getContextPath() + "/admin/songs.jsp");
		} else {
			request.getSession().setAttribute("error", "Unable to add song.");
			response.sendRedirect(request.getContextPath() + "/admin/add-song.jsp");
		}
		
	}

}
