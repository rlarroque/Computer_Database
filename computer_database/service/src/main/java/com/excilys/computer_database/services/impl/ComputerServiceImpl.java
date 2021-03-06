package com.excilys.computer_database.services.impl;

import java.sql.SQLException;
import java.util.List;

import com.excilys.computer_database.validator.ComputerValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.excilys.computer_database.exception.IntegrityException;
import com.excilys.computer_database.dao.ComputerDAO;
import com.excilys.computer_database.model.Computer;
import com.excilys.computer_database.model.Page;
import com.excilys.computer_database.services.ComputerService;
import org.springframework.transaction.annotation.Transactional;

/**
 * This class is the implementation of the ComputerService interface. The layer
 * service is calling the DAO methods and also contains some validation of the
 * integrity of the data passed.
 * @author rlarroque
 *
 */
@Service
@Transactional
public class ComputerServiceImpl implements ComputerService {

	@Autowired
	private ComputerDAO computerDAO;

	@Override
	public List<Computer> getAll() {
		return computerDAO.getAll();
	}

	@Override
	public List<Computer> getPage(Page page) {
		return computerDAO.getPage(page);
	}

	@Override
	public Computer get(long id) {

		if (id < 1) {
			throw new IntegrityException("Id cannot be negativ.");
		}

		return computerDAO.get(id);
	}

	@Override
	public Computer get(String name) {

		if (name == null || name == "") {
			throw new IntegrityException("A name is mandatory for a computer.");
		}

		return computerDAO.get(name);
	}

	@Override
	public long create(Computer computer) {

		ComputerValidator.validate(computer);

		return computerDAO.create(computer);
	}

	@Override
	public void update(Computer computer) {

		ComputerValidator.validate(computer);

		if (computer.getId() < 1l) {
			throw new IntegrityException("The computer's id is invalid.");
		}

		computerDAO.update(computer);
	}

	@Override
	public void delete(long id) {

		if (id < 1) {
			throw new IntegrityException("Id cannot be negativ.");
		}

		computerDAO.delete(id);
	}

	@Override
	public int count(Page page) {
		return computerDAO.count(page);
	}

	@Override
	public void deleteByCompany(long id) throws SQLException {
		if (id < 1) {
			throw new IntegrityException("Id cannot be negativ.");
		}

		computerDAO.deleteByCompany(id);
	}
}