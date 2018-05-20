/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Programador
 */
public class UsuarioDAO extends Usuario {

    public EntityManager getEM() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("JSPVENDA");
        return factory.createEntityManager();
    }

    public List<Usuario> selecionar() {
        EntityManager em = getEM();
        Query qry = em.createQuery("SELECT u FROM Usuario u", Usuario.class);
        return qry.getResultList();
    }

}
