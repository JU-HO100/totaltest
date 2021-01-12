package com.ch3;

public class LGTV implements TV {

	@Override
	public void powerOn() {
		System.out.println("LG 전원을 켠다");
	}

	@Override
	public void powerOff() {
		System.out.println("LG 전원을 끈다");
	}

	@Override
	public void volumeUp() {
		System.out.println("LG 소리를 높인다.");

	}

	@Override
	public void volumeDown() {
		System.out.println("LG 소리를 낮춘다.");

	}

}
