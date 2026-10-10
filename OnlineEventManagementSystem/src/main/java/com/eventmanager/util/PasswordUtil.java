package com.eventmanager.util;
import java.nio.charset.StandardCharsets; import java.security.MessageDigest;
public class PasswordUtil {
 public static String sha256(String value){ try { MessageDigest md=MessageDigest.getInstance("SHA-256"); byte[] b=md.digest(value.getBytes(StandardCharsets.UTF_8)); StringBuilder s=new StringBuilder(); for(byte x:b)s.append(String.format("%02x",x)); return s.toString(); } catch(Exception e){throw new RuntimeException(e);} }
}
