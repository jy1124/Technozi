package com.technozi.enumerated;

public enum CheckInStatus {
	CheckIn(0),
	CheckOut(1);
	
	private int value;
	   
	private CheckInStatus(int value) {
		this.value = value;
	}
	
	public int getInt() {
		return this.value;
	}
	
	public static CheckInStatus getType(int value) {
		return CheckInStatus.values()[value];
	}

}
