package com.cfr.web.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 *	일반문자열 유틸.
 *
 * @author someone
 * @version 1.0.0
 */
public class JsonUtil {

	/**
	 * 로그 출력.
	 */
	@SuppressWarnings("unused")
	private static Logger logger = Logger.getLogger(JsonUtil.class);

	/**
	 * Map을 jsonString으로 변환한다.
	 *
	 * @param map Map<String, Object>.
	 * @return String.
	 */
	@SuppressWarnings("unchecked")
	public static JSONObject getJsonStringFromMap( Map<String, Object> map ) {

		JSONObject json = new JSONObject();
		for( Map.Entry<String, Object> entry : map.entrySet() ) {
			String key = entry.getKey();
			Object value = entry.getValue();
			json.put(key, value);
		}
		
		return json;
	}
	
	/**
	 * List<Map>을 json으로 변환한다.
	 *
	 * @param list List<Map<String, Object>>.
	 * @return JSONArray.
	 */
	@SuppressWarnings("unchecked")
	public static JSONArray getJsonArrayFromList( List<Map<String, Object>> list ) {

		JSONArray jsonArray = new JSONArray();
		for( Map<String, Object> map : list ) {
			jsonArray.add( getJsonStringFromMap( map ) );
		}
		
		return jsonArray;
	}
	
	/**
	 * List<Map>을 jsonString으로 변환한다.
	 *
	 * @param list List<Map<String, Object>>.
	 * @return String.
	 */
	@SuppressWarnings("unchecked")
	public static String getJsonStringFromList( List<Map<String, Object>> list ) {

		JSONArray jsonArray = new JSONArray();
		for( Map<String, Object> map : list ) {
			jsonArray.add( getJsonStringFromMap( map ) );
		}
		
		return jsonArray.toJSONString();
	}

	/**
	 * JsonObject를 Map<String, String>으로 변환한다.
	 *
	 * @param jsonObj JSONObject.
	 * @return String.
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getMapFromJsonObject( JSONObject jsonObj ) {

		Map<String, Object> map = null;
		
		try {
			
			map = new ObjectMapper().readValue(jsonObj.toJSONString(), Map.class) ;
			
		} catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return map;
	}

	/**
	 * JsonArray를 List<Map<String, String>>으로 변환한다.
	 *
	 * @param jsonArray JSONArray.
	 * @return List<Map<String, Object>>.
	 */
	public static List<Map<String, Object>> getListMapFromJsonArray( JSONArray jsonArray ) {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		if( jsonArray != null )
		{
			int jsonSize = jsonArray.size();
			for( int i = 0; i < jsonSize; i++ )
			{
				Map<String, Object> map = JsonUtil.getMapFromJsonObject( ( JSONObject ) jsonArray.get(i) );
				list.add( map );
			}
		}
		
		return list;
	}
}