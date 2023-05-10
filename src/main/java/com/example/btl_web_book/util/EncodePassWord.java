package com.example.btl_web_book.util;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class EncodePassWord {
    public static String toSHA1(String toEncrypt) {
        String salt = "fE4wd#u*d9b9kdKszgè02ep5à4qZa!éi6";
        String res = null;
        toEncrypt = toEncrypt + salt;
        try {
            byte[] dataBytes = toEncrypt.getBytes(StandardCharsets.UTF_8);
            //Một hàm băm nhận đầu vào là một xâu ký tự dài (hay thông điệp) có độ dài tùy ý và tạo ra kết quả là một xâu ký tự có độ dài cố định,
            // đôi khi được gọi là tóm tắt thông điệp (message digest) hoặc chữ ký số (digital fingerprint)
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            res = Base64.getEncoder().encodeToString(md.digest(dataBytes));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return res;
    }
}
