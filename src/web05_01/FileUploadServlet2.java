package web05_01;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class FileUploadServlet2
 */
@MultipartConfig
@WebServlet("/web05_01/FileUploadServlet2")
public class FileUploadServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String 업로드_폴더 = "/upload"; // 업로드된파일을저장할폴더

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FileUploadServlet2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8"); // request parameter에한글이포함된경우에필수
		String 제목 = request.getParameter("title");

		Part filePart = request.getPart("upload1"); // 업로드된파일데이터
		String 파일명 = getFileName(filePart);    // 파일명구하기
		long 파일크기 = filePart.getSize();         // 파일크기구하기

		String 폴더경로 = request.getServletContext().getRealPath(업로드_폴더); // 폴더경로계산
		Path path = Paths.get(폴더경로, 파일명);                       // 저장할파일의경로계산
		if (파일크기> 0) saveFile(filePart, path);                    // 파일저장하기
		String 다운로드URL = request.getContextPath() + 업로드_폴더 + "/" + 파일명; // 파일다운로드 URL 계산

		request.setAttribute("제목", 제목);
		request.setAttribute("파일명", 파일명);
		request.setAttribute("파일크기", 파일크기);
		request.setAttribute("저장된파일", 파일명);
		if (파일크기> 0) {
			request.setAttribute("파일명", path.toString());
			request.setAttribute("다운로드URL", 다운로드URL);
		}
		request.getRequestDispatcher("download2.jsp").forward(request, response);
	}

	private String getFileName(Part filePart) {
		for (String content : filePart.getHeader("content-disposition").split(";"))
			if (content.trim().startsWith("filename")) {
				String path = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
				return new File(path).getName();
			}
		return null;
	}

	private void saveFile(Part filePart, Path path) throws IOException {
		InputStream inputStream = filePart.getInputStream();
		OutputStream outputStream = new FileOutputStream(path.toFile());
		try {
			int read = 0;
			final byte[] bytes = new byte[1024];
			while ((read = inputStream.read(bytes)) != -1)
				outputStream.write(bytes, 0, read);
		} finally {
			if (outputStream != null) outputStream.close();
			if (inputStream != null) inputStream.close();
		}
	}
}

