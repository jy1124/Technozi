package com.technozi.enumerated;

public enum UserType {
	Public(0),
	Business(1),
	HealthStaff(2),
	HealthOrganisation(3);
	
	private int value;
	   
	private UserType(int value) {
		this.value = value;
	}
	
	public int getInt() {
		return this.value;
	}
	
	public static UserType getType(int value) {
		return UserType.values()[value];
	}

	public int getUserTypeAsInt() {
	        return value;
    }
	
    public static int convertUserTypeToInt(UserType inputType) {
        for (UserType userType : UserType.values()) {
            if (userType.getUserTypeAsInt() == inputType.getUserTypeAsInt()) {
                return userType.getUserTypeAsInt();
            }
        }
        return -1;
    }
}



