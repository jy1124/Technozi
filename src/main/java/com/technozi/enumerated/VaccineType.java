package com.technozi.enumerated;

public enum VaccineType {
	PfizerBioNTech(0),
	Moderna(1),
	Arcturus(2);
	
	private int value;
	   
	private VaccineType(int value) {
		this.value = value;
	}
	
	public int getInt() {
		return this.value;
	}
	
	public static VaccineType getType(int value) {
		return VaccineType.values()[value];
	}

}
