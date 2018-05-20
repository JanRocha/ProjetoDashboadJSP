/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Produto;
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
public class ProdutoDAO extends Produto {

    public EntityManager getEM() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("JSPVENDA");
        return factory.createEntityManager();
    }

    public List<Produto> selecionar() {
        EntityManager em = getEM();
        Query qry = em.createQuery("SELECT u FROM Produto u", Produto.class);
        return qry.getResultList();
    }

    public Produto selecionar(Produto local) {
        EntityManager em = getEM();
        em.getTransaction().begin();
        Produto cli = em.find(Produto.class, local.getId());
        em.getTransaction().commit();
        em.close();
        return cli;
    }

}
