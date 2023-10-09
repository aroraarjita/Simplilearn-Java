package com.simplilearn.flyawayweb.dao.interfaces;

import com.simplilearn.flyawayweb.entity.Admin;

public interface IAdminDAO {

	int addAdmin(Admin admin);
	
	int updateAdmin(Admin admin);
	
	Admin getAdminDetails(String username, String password);
	
	Long getAdminRowCount();
}
