package com.entity;

public class Movie {
	private int iD=0;
	private String movieName=null;
	private String director;
	private String origins=null;//产地
	private String actor_sum=null;//protagonist
	
	private Integer D_type=2;
	private  String movie_type;
	private  String introduction;
	private  double score=0;
	private  String release_date;
	
	private  String time;
	private  String language;
	private  String path=null;
	//private  double box_profit=0;	
	private double money=0.0; //box_office
	
	//private  String
	public Movie() {
		// TODO Auto-generated constructor stub
	}
	
	public int getiD() {
		return iD;
	}
	public String getMovieName() {
		return movieName;
	}
	public String getDirector() {
		return director;
	}
	public String getActor_sum() {
		return actor_sum;
	}
	
	public Integer getD_type() {
		return D_type;
	}
	public String getIntroduction() {
		return introduction;
	}
	public String getLanguage() {
		return language;
	}
	public double getMoney() {
		return money;
	}
	public String getMovie_type() {
		return movie_type;
	}
	
	public String getOrigins() {
		return origins;
	}
	public String getPath() {
		return path;
	}
	public String getRelease_date() {
		return release_date;
	}
	public double getScore() {
		return score;
	}
	public String getTime() {
		return time;
	}
	//------------------------------------
	public void setActor_sum(String actor_sum) {
		this.actor_sum = actor_sum;
	}
	
	public void setD_type(Integer d_type) {
		D_type = d_type;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public void setiD(int iD) {
		this.iD = iD;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public void setMovie_type(String movie_type) {
		this.movie_type = movie_type;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public void setOrigins(String origins) {
		this.origins = origins;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public void setTime(String time) {
		this.time = time;
	}

	
	
	
	
	

}
