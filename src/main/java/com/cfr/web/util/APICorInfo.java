package com.cfr.web.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class APICorInfo {
	
	private String cp_code;
	
	public void setSearchText(String cp_code) {
		this.cp_code=cp_code;
	}
	
    public String APICorInfo() throws ParseException {
    	
    	StringBuffer response = null;
	    try {
	        String apiURL = "http://dart.fss.or.kr/api/company.json?auth=f2706496b2a489dca6639c2c77a068aa71501461&crp_cd="+cp_code;
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");

	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 정상 호출
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
	        } else {  // 에러 발생
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	        }
	        String inputLine;
	        response = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	            response.append(inputLine);
	        }
	        br.close();
	    } catch (Exception e) {
	        System.out.println(e);
	    }
		return response.toString();
    }
    public static void main(String[] args) throws ParseException {
		System.out.println("시작");
		APICorInfo naverNews = new APICorInfo();
		naverNews.setSearchText("095570");
		System.out.println(naverNews.APICorInfo());

	}
}