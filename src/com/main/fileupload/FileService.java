package com.main.fileupload;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class FileService {
	private fileuploadDAO fuploadDAO = null;

	
	public FileService() {
		fuploadDAO = new fileuploadDAO();
	}
	
	public boolean fileUpload(String name, int price, String category, String comment, String filename1, String filename2, String filename3, String filename4, String filename5, String filepath, String email) {
		fileuploadDTO fileuploadDTO = new fileuploadDTO();
		
		fileuploadDTO.setName(name);
		fileuploadDTO.setCategory(category);
		fileuploadDTO.setPrice(price);
		fileuploadDTO.setComment(comment);
		fileuploadDTO.setFilename1(filename1);
		fileuploadDTO.setFilename2(filename2);
		fileuploadDTO.setFilename3(filename3);
		fileuploadDTO.setFilename4(filename4);
		fileuploadDTO.setFilename5(filename5);
		fileuploadDTO.setFilepath(filepath);
		fileuploadDTO.setEmail(email);
		
		fileuploadDTO = fuploadDAO.insertFile(fileuploadDTO);
		
		if(fileuploadDTO!=null) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean fileUploadidx(String name, String category,  int price, String comment, String uploadpath, String filename1, String filepath) {	
		fileuploadDTO fileuploadDTO = new fileuploadDTO();
		
		fileuploadDTO.setName(name);
		fileuploadDTO.setCategory(category);
		fileuploadDTO.setPrice(price);
		fileuploadDTO.setComment(comment);
	
		
		//fileuploadDTO.setUploadpath(uploadpath);
		
		fileuploadDTO.setFilename1(filename1);
		fileuploadDTO.setFilepath(filepath);
		//fileuploadDTO.setFilename2(filename2);
		//fileuploadDTO.setFilename3(filename3);
		//fileuploadDTO.setFilename4(filename4);
		//fileuploadDTO.setFilename5(filename5);
		
		
		
		fileuploadDTO = fuploadDAO.insertFile(fileuploadDTO);
	
		if(fileuploadDTO!=null) {
			return true;
		}else {
			return false;
		}
	}

/*getToday()와 moveFile()쪽 기능은 imgup.jsp에서 구현 후 저장시켜놓음
 * 
 * 
 * 날짜
 * public static String getToday() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyMMdd");
		return sdf.format(cal.getTime());
	}
	
	
	public void moveFile(fileuploadDTO fileuploadDTO, File file) {
		File dir = new File(SAVE_PATH + "/" +getToday());
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		if(file.isFile()) {
			File newFile = new File(SAVE_PATH + fileuploadDTO.getFilepath());
			file.renameTo(newFile);
		}
	}*/
}
