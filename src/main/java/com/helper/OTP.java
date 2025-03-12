package com.helper;

import java.util.Random;

public class OTP {
    // Generates a numeric OTP of the specified length
    public static String generateOTP(int otpLength) {
        Random random = new Random();
        StringBuilder otpBuilder = new StringBuilder();
        for (int i = 0; i < otpLength; i++) {
            otpBuilder.append(random.nextInt(10));
        }
        return otpBuilder.toString();
    }
}
