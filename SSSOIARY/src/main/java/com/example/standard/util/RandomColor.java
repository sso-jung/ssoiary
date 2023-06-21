package com.example.standard.util;

import java.util.Random;

public class RandomColor {
	
	public String Generate() {
		Random random = new Random();
		int r = random.nextInt(256);
		int g = random.nextInt(256);
		int b = random.nextInt(256);
		return String.format("#%02x%02x%02x", r, g, b);
	}
}
