package com.technozi.enumerated;

public enum LoginStatus {
	SUCESS_LOGIN(0),
	WRONG_CREDENTIALS(1),
	INACTIVE(2),
	SUSPENDED(3),
	ERROR(4);
	
	private int value;
	   
	private LoginStatus(int value) {
		this.value = value;
	}
	
	public int getInt() {
		return this.value;
	}
	
	public static LoginStatus getType(int value) {
		return LoginStatus.values()[value];
	}

}
