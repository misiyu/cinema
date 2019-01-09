package com.entity;

public class Play {
	private int movie_id;
	private int  mhall_id;
	private String start_time;
	
	
	
	public Play() {
		
	}
	
	public void setMhall_id(int mhall_id) {
		this.mhall_id = mhall_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	
	public int getMhall_id() {
		return mhall_id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public String getStart_time() {
		return start_time;
	}
	

}
