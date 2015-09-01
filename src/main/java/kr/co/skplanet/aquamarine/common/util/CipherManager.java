package kr.co.skplanet.aquamarine.common.util;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Hex;

/**
 * 암복호화 클래스
 * 패스워드 암호화,복호화 기능 제공
 * [주의!] key 에 해당하는 문자열을 16byte(128) 또는 24byte(192) 또는 32byte(256) 생성
 * @author skplanet
 *
 */
public class CipherManager {
    
    public static String SECRET_KEY = "0123456789123456";
    
    public CipherManager() {
    }
    
    /**
     * 동적으로 내부 키 생성 및 암복호화 수행
     * @param isKeyGen 동적으로 암복호화 키 생성여부
     * @throws Exception
     */
    public CipherManager(boolean isKeyGen)  throws Exception {
        if (isKeyGen) {
            createSecretKey();
        }
    }
    
    /**
     * 128 비트 비밀키 생성한다.
     */
    public void createSecretKey() throws Exception {
        // 1. 128 비트 비밀키 생성
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        kgen.init(128);
        SecretKey skey = kgen.generateKey();
        
        // 2. 비밀 키를 이렇게 저장하여 사용하면 암호화/복호화가 편해진다.
        SECRET_KEY = Hex.encodeHexString(skey.getEncoded());
    }
    
    /**
     * AES 방식의 암호화
     * 내부 동적키를 이용해 암호화 수행
     *
     * @param message
     * @return
     * @throws Exception
     */
    public static String encrypt(String message) throws Exception {
        return encrypt(message, SECRET_KEY);
    }
    
    public static String encrypt(String message, String secretKey) throws Exception {
        // use key coss2
        SecretKeySpec skeySpec = new SecretKeySpec(secretKey.getBytes(), "AES");
        
        // Instantiate the cipher
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
    
        byte[] encrypted = cipher.doFinal(message.getBytes());
        return byteArrayToHex(encrypted);        
    }
    
    /**
     * AES 방식의 복호화
     * 내부 동적키를 이용해 복호화
     * @param message
     * @return
     * @throws Exception
     */
    public static String decrypt(String message) throws Exception {
        return decrypt(message, SECRET_KEY);
    }
    
    public static String decrypt(String message, String secretKey) throws Exception {
        // use key coss2
        SecretKeySpec skeySpec = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
    
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] original = cipher.doFinal(hexToByteArray(message));
        String originalString = new String(original);
        return originalString;        
    }
    
    /**
     * hex to byte[] : 16진수 문자열을 바이트 배열로 변환한다.
     *
     * @param hex    hex string
     * @return
     */
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() == 0) {
            return null;
        }
    
        byte[] ba = new byte[hex.length() / 2];
        for (int i = 0; i < ba.length; i++) {
            ba[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
        }
        return ba;
    }
    
    /**
     * byte[] to hex : unsigned byte(바이트) 배열을 16진수 문자열로 바꾼다.
     *
     * @param ba        byte[]
     * @return
     */
    public static String byteArrayToHex(byte[] ba) {
        if (ba == null || ba.length == 0) {
            return null;
        }
    
        StringBuffer sb = new StringBuffer(ba.length * 2);
        String hexNumber;
        for (int x = 0; x < ba.length; x++) {
            hexNumber = "0" + Integer.toHexString(0xff & ba[x]);
    
            sb.append(hexNumber.substring(hexNumber.length() - 2));
        }
        return sb.toString();
    }    
}
