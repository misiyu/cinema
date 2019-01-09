package com.support;

import java.util.regex.Pattern;

public class StringExtend {

	public static boolean isNumberic(String string){
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		return pattern.matcher(string).matches();
	}
}
