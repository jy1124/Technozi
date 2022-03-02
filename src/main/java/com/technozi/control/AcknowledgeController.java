package com.technozi.control;

import com.technozi.entity.Business;
import com.technozi.entity.PublicUser;
import com.technozi.enumerated.UserType;

public class AcknowledgeController {

	public boolean requestAcknowledge(String recordID, String userType) {
		if (userType.equals(UserType.Public.toString())) {
			PublicUser publicUser = new PublicUser();
			return publicUser.attemptAcknowledgement(recordID);
		} else {
			Business business = new Business();
			return business.attemptAcknowledgement(recordID);
		}
	}
}
