package org.tu.varna;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class USER_RIGHTS {
	@Id
	private int ID;
	private Boolean RIGHTS;
	private String DESCRIPTION;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public Boolean getRIGHTS() {
		return RIGHTS;
	}
	public void setRIGHTS(Boolean rIGHTS) {
		RIGHTS = rIGHTS;
	}
	public String getDESCRIPTION() {
		return DESCRIPTION;
	}
	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}

}
