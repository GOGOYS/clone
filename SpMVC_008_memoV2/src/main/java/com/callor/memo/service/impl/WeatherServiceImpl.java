package com.callor.memo.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Service;

import com.callor.memo.config.Config;
import com.callor.memo.model.WeatherVO;
import com.callor.memo.service.WeatherService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WeatherServiceImpl implements WeatherService{

	@Override
	public List<WeatherVO> getWeather() throws IOException {
		// TODO Auto-generated method stub
		
		String url = "http://apis.data.go.kr/1360000/VilageFcstMsgService/getLandFcst";
		try {
			url += ("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + Config.weatherEncoding);
			url += ("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과수 이거 필수값 아님 없애도 됨*/
			url += ("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호 이거 필수값 아님 없애도 됨*/
			url += ("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode("11A00101", "UTF-8")); /*지역코드 */
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//파일 읽어들이기
        URL realUrl = new URL(url);
        HttpURLConnection conn = (HttpURLConnection) realUrl.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
//        // log.debug("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        String retString = "";
        String line;
        while((line = rd.readLine()) != null) {
        	retString += line;
        }
        rd.close();
        conn.disconnect();
        
        JSONObject json = XML.toJSONObject(retString);
        String jsonStr = json.toString(4);
        
        JSONObject jObject = new JSONObject(jsonStr);
        
      //response 안으로
        JSONObject response = jObject.getJSONObject("response");
        //log.debug(response.toString(4));
        
        // body 안으로
        JSONObject body = response.getJSONObject("body");
        //log.debug(body.toString(4));
        
        //items 안으로
        JSONObject items = body.getJSONObject("items");
        //log.debug(items.toString(4));
        
        //item은 배열로 생성
        JSONArray item = items.getJSONArray("item");
//        // log.debug(item.toString(4));
      
        //json 배열을 List형으로 변형해서 VO에 저장
        Gson gson = new Gson();
        List<WeatherVO> list = gson.fromJson(item.toString(), new TypeToken<List<WeatherVO>>(){}.getType());
		return list;
	}

}
