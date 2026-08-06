package controller;

import java.io.File;
import java.io.IOException;

import dao.SongDao;
import dao.SongDaoInterface;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Song;


@WebServlet("/DeleteSongController")
public class DeleteSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		SongDaoInterface dao = new SongDao();

		Song song = dao.getSongById(id);

		if (song != null) {
			String imagePath = getServletContext().getRealPath("/assets/images/songs");
			String audioPath = getServletContext().getRealPath("/assets/audio/songs");
			
			File image = new File(imagePath, song.getCoverImage());
			File audio = new File(audioPath, song.getAudioFile());
			boolean status = dao.deleteSong(id);

			if (status) {
			    image.delete();
			    audio.delete();
			}
		}

		response.sendRedirect(request.getContextPath() + "/admin/songs.jsp");

	}

}
