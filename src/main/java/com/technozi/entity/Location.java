package com.technozi.entity;

abstract class Location {

	protected String location;

	public void setLocation(String location) {
		this.location = location;
	}

	public abstract String toString();
}
