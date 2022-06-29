package com.greatlearning.library.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.greatlearning.library.model.Form;

@Repository
public class FormService {

	private SessionFactory sessionFactory;
	private Session session;
	
	@Autowired
	public FormService(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			session = sessionFactory.openSession();
		}
	}
	
	@Transactional
	public List<Form> findForm()
	{
		return session.createQuery("from Form").list();
	}
	
	@Transactional
	public void saveForm(Form form)
	{
		try {
			Transaction tx = session.beginTransaction();
			
			System.out.println();
			System.out.println();
			session.saveOrUpdate(form);
			
			System.out.println(form);
			System.out.println();
			tx.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@Transactional
	public void deleteById(int id)
	{
		try {
			Transaction tx = session.beginTransaction();
			
			Form form = session.get(Form.class, id);
			
			session.delete(form);
			
			tx.commit();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional
	public List<Form> findBy(String name)
	{
		try {
			Transaction tx = session.beginTransaction();
			
			System.out.println();
			System.out.println();
			
			String query = "from Form where name like '%" 
			+ name + "%' or department like '%" + name + "%' or country like '%" + name + "%'";
			List<Form> forms = session.createQuery(query).list();
			System.out.println(forms);
			tx.commit();
			
			System.out.println();
			System.out.println();
			
			return forms;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Transactional
	public Form findById(int id)
	{
		try {
			Transaction tx = session.beginTransaction();
			Form form = session.get(Form.class, id);
			
			System.out.println();
			System.out.println();
			System.out.println(form);
			System.out.println();
			System.out.println();
			tx.commit();
			
			return form;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	@Transactional
	public Form updateForm(int id, String name, String department, String country)
	{
		try {
			Transaction tx = session.beginTransaction();
			
			System.out.println();
			System.out.println();
			
			Form form = session.get(Form.class, id);
			form.setId(id);
			form.setName(name);
			form.setDepartment(department);
			form.setCountry(country);
			
			System.out.println(form);
			
			System.out.println();
			
			tx.commit();
			
			return null;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
