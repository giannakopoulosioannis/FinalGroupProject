package com.mycompany.dao;

import com.mycompany.entities.Product;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();

    }

    @Override
    public List<Product> findAll() {
        Query q = getSession().createQuery("SELECT p FROM Product p");
        List<Product> list = q.getResultList();
        return list;
    }

    @Override
    public void createOrUpdate(Product p) {
        getSession().saveOrUpdate(p);

    }

    @Override
    public void delete(Integer id) {
        String query = "DELETE FROM Product p WHERE p.pcode=:id";
        Query q = getSession().createQuery(query);
        q.setParameter("id", id);
        int result = q.executeUpdate();

    }

    @Override
    public Product findById(Integer id) {
        Product p = (Product) getSession().get(Product.class, id);
        return p;

    }

    @Override
    public List<Product> findByUserCriteria(String searchCriteria) {
        if (searchCriteria == "") {
            return new ArrayList<Product>();
        } else {
            Query q = getSession().createQuery("SELECT p FROM Product p WHERE p.pcategory LIKE :pcat OR p.psubcat LIKE :psubcat OR p.pdescr LIKE :pdescr");
            q.setParameter("pcat", "%" + searchCriteria + "%");
            q.setParameter("psubcat", "%" + searchCriteria + "%");
            q.setParameter("pdescr", "%" + searchCriteria + "%");
            List<Product> list = q.getResultList();
            return list;
        }
    }

}
