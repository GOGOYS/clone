package com.callor.memo.service;

import java.io.IOException;
import java.util.List;

import com.callor.memo.model.WeatherVO;

public interface WeatherService {
	
	public WeatherVO getWeather() throws IOException;
	public String getRNYN(WeatherVO weatherVO);
}
