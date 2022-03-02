package com.technozi.control;

import java.util.List;
import com.technozi.entity.Business;

public class BusinessVisitHistoryController {

	public List<String> requestBusinessVisitHistory(String username, String date) {
		Business business = new Business();
		return business.getVisitorHistory(username, date);
	}
}
