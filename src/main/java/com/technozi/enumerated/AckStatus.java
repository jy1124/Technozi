package com.technozi.enumerated;

public enum AckStatus {
	Pending(0),
	Acknowledged(1);
	
	private int value;
	   
	private AckStatus(int value) {
		this.value = value;
	}
	
	public int getInt() {
		return this.value;
	}
	
	public static AckStatus getType(int value) {
		return AckStatus.values()[value];
	}

}
