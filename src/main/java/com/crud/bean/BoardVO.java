package com.crud.bean;

import java.awt.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Blob;
import java.util.Date;

public class BoardVO {
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrivacy() {
		return privacy;
	}

	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}



	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	private int id;
	private String title;
	private String content;
	private int privacy;

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	private String datetime;
	private String subject;

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	private String color;

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	private int views;

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	private File image;

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	private String writer;
	private String font;

	public String getFont() {
		return font;
	}

	public void setFont(String font) {
		this.font = font;
	}
}
