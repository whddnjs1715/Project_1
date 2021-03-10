package com.main.fileupload;

import java.util.Collection;

public class fileuploadDTO {
	
	private int idx;
	private String name;
	private String category;
	private int price;
	private String comment;
	private String filename1;
	private String filename2;
	private String filename3;
	private String filename4;
	private String filename5;
	private String filepath;
	private String email;
	//private String uploadpath; �닔�젙 �쟾�뿉 �엳�뿀�쓬 寃뚰꽣�꽭�꽣�옉 �븿猿�
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}
	public String getFilename2() {
		return filename2;
	}
	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}
	public String getFilename3() {
		return filename3;
	}
	public void setFilename3(String filename3) {
		this.filename3 = filename3;
	}
	public String getFilename4() {
		return filename4;
	}
	public void setFilename4(String filename4) {
		this.filename4 = filename4;
	}
	public String getFilename5() {
		return filename5;
	}
	public void setFilename5(String filename5) {
		this.filename5 = filename5;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
}
