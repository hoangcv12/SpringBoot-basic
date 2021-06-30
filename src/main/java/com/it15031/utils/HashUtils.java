package com.it15031.utils;

import org.mindrot.jbcrypt.BCrypt;

public class HashUtils {
	public static String hash(String palin) {
		String salt=BCrypt.gensalt();
		return BCrypt.hashpw(palin, salt);
	}
	public static boolean verify(String palin, String hashed) {
		return BCrypt.checkpw(palin, hashed);
	}
}
