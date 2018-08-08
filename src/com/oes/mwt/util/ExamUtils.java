package com.oes.mwt.util;

import java.io.IOException;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.codehaus.jackson.map.ObjectMapper;

public class ExamUtils {

	public static String getEasyUIDataGridModel(List<Map<String, String>> model,Long count) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		ObjectMapper om = new ObjectMapper();
		resultMap.put("rows", model);
		resultMap.put("total", count);
		return om.writeValueAsString(resultMap);
	}
	
	public static void responseWriteJson(HttpServletResponse resp,String result){
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json; charset=utf-8");
		try {
			resp.getWriter().print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 根据 ans_id 获取答案码
	 * @param ans_id
	 * @return
	 */
	public static long statistics (List<String> ans_id){
		
		StringBuffer sb = new StringBuffer("");
		
		for (String id : ans_id){
			sb.append(id);
		}
		
		char[] cArr = sb.toString().toCharArray();
		
		long result = 0;
		
		for (char c : cArr){
			result += c+0;
		}
		
		return result;
	}

	public static String md5(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte b[] = md.digest();

			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			str = buf.toString();
		} catch (Exception e) {
			e.printStackTrace();

		}
		
		return str;
	}
	
	
	public static String TrasformDateToString (Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		if (date != null){
			return sdf.format(date);
		}else{
			return null;
		}
	}
	
	public static String TrasformGetimeToString (Long date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		if (date != null){
			return sdf.format(new Date(date));
		}else{
			return null;
		}
	}
}
