package com.excilys.computer_database.service;

import java.sql.SQLException;
import java.util.List;

import com.excilys.computer_database.persistence.model.Company;

/**
 * Interface of the company service
 * @author rlarroque
 *
 */
public interface CompanyService {
	
	/**
	 * Get the list of all the existing companies in the db.
	 * @return the List of Companies
	 */
	public List<Company> getAll();
	
	/**
	 * Delete a company based on the id passed. The computers with this company will
	 * also be deleted. 
	 * @param id id of the company to delete
	 * @throws SQLException 
	 */
	public void delete(int id) throws SQLException;
}
