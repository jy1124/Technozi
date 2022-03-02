package com.technozi.enumerated;

public enum AccountStatus {
	Active(0),
	Inactive(1);
	
	private int value;
	   
	private AccountStatus(int value) {
		this.value = value;
	}
	
	public int getInt() {
		return this.value;
	}
	
	public static AccountStatus getType(int value) {
		return AccountStatus.values()[value];
	}

}
