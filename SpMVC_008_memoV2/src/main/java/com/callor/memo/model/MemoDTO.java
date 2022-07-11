package com.callor.memo.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 * DTO의 역할은 VO와 같다
 * Data Transfer Object
 */
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemoDTO {
	
	private long m_seq;
	private String m_author;
	private String m_date;
	private String m_time;
	private String m_weather;
	private String m_title;
	private String m_memo;
	private String m_image;
	private String m_mapx;
	private String m_mapy;
	private String m_icon;
	private String m_personal;
	
	private String m_up_image;
}
