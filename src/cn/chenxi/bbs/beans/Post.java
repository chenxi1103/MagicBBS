package cn.chenxi.bbs.beans;

import java.sql.Timestamp;

public class Post {

	private int id;
	private String postTitle;
	private String postContent;
	private String postAuthor;
	private Timestamp publishTime;
	private String postType;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostAuthor() {
		return postAuthor;
	}
	public void setPostAuthor(String postAuthor) {
		this.postAuthor = postAuthor;
	}
	public Timestamp getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Timestamp publishTime) {
		this.publishTime = publishTime;
	}
	public String getPostType() {
		return postType;
	}
	public void setPostType(String postType) {
		this.postType = postType;
	}
	public Post(int id, String postTitle, String postContent, String postAuthor, Timestamp publishTime,
			String postType) {
		super();
		this.id = id;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postAuthor = postAuthor;
		this.publishTime = publishTime;
		this.postType = postType;
	}
	
	public Post() {
	}
	@Override
	public String toString() {
		return "Post [id=" + id + ", postTitle=" + postTitle + ", postContent=" + postContent + ", postAuthor="
				+ postAuthor + ", publishTime=" + publishTime + ", postType=" + postType + "]";
	}
	
	
}
