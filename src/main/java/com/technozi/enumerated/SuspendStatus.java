package com.technozi.enumerated;

public enum SuspendStatus {
	No(0),
	Yes(1);
	
	private int value;
	   
	private SuspendStatus(int value) {
		this.value = value;
	}
	
	public int getInt() {
		return this.value;
	}
	
	public static SuspendStatus getType(int value) {
		return SuspendStatus.values()[value];
	}

}
