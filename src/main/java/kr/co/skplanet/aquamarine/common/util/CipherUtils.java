package kr.co.skplanet.aquamarine.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

/**
 * <p>암복호화 처리
 *  
 * @author 이도현
 *
 */
public class CipherUtils {

	/**
	 * <p>SHA-256을 이용하여 문자열을 암호화
	 * 
	 * @param str : 암호화할 문자열
	 * @return : 암호화된 문자열
	 */
	public static String encrytBySHA256(String str) {

		String encrytStr = "";

		try {

			MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
			sha256.update(str.getBytes());
			byte[] byteData = sha256.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16)
								 .substring(1));
			}
			encrytStr = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			encrytStr = null;
		}

		return encrytStr;

	}

	/**
	 * <p>비밀키 생성(AES128)
	 * 
	 * @return 생성된 비밀키
	 */
	public static String generateSecrecKeyString() {

		try {

			KeyGenerator keyGen = KeyGenerator.getInstance("AES");

			keyGen.init(128);

			return Base64.encodeBase64String(keyGen.generateKey()
												   .getEncoded());

		} catch (NoSuchAlgorithmException e) {

			throw new RuntimeException(e);

		}

	}

	/**
	 * <p>제공된 비밀키로 데이터를 암호화(AES128)
	 * 
	 * @param input 암호화할 데이터
	 * @param secretKeyString 비밀키
	 * @return 암호화된 문자열
	 */
	public static String encrypt(byte[] input,
								 String secretKeyString) {

		try {

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

			cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(Base64.decodeBase64(secretKeyString), "AES"), getIV(secretKeyString));

			return new String(Base64.encodeBase64((cipher.doFinal(input))));

		} catch (Exception e) {

			throw new RuntimeException(e);

		}

	}

	/**
	 * <p>제공된 비밀키로 데이터를 복호화(AES128)
	 * 
	 * @param input 암호화된 데이터
	 * @param secretKeyString 비밀키
	 * @return 복호화된 문자열(바이트 배열)
	 */
	public static byte[] decrypt(String input,
								 String secretKeyString) {

		try {

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

			cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(Base64.decodeBase64(secretKeyString), "AES"), getIV(secretKeyString));

			return cipher.doFinal(Base64.decodeBase64(input));

		} catch (Exception e) {

			throw new RuntimeException(e);

		}

	}
	
	private static IvParameterSpec getIV(String secretKeyString){
		
		return new IvParameterSpec(secretKeyString.substring(0, 16).getBytes());
		
	}

}
