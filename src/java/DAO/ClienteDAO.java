/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Cliente;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Programador
 */
public class ClienteDAO extends Cliente {

    public EntityManager getEM() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("JSPVENDA");
        return factory.createEntityManager();
    }

    public List<Cliente> selecionar() {
        EntityManager em = getEM();
        Query qry = em.createQuery("SELECT u FROM Cliente u", Cliente.class);
        return qry.getResultList();
    }

    public Cliente selecionar(Cliente local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        Cliente cli = em.find(Cliente.class, local.getId());
        em.getTransaction().commit();
        em.close();
        return cli;
    }

}
