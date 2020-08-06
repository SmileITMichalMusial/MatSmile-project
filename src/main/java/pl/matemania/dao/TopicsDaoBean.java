package pl.matemania.dao;

import pl.matemania.domain.topics.TopicLayer1;

import javax.ejb.Stateless;
import javax.persistence.*;
import java.util.List;

@Stateless
public class TopicsDaoBean implements TopicsDao {

    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("primary");


    @Override
    public TopicLayer1 getSingleTopicLayer1(int id1) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        TopicLayer1 topicLayer1 = entityManager.find(TopicLayer1.class, id1);
        return topicLayer1;
    }


    @Override
    public List getTopicLayer1FromDb() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer1> topicLayer1List = entityManager.createQuery("FROM TopicLayer1 ").getResultList();


        return topicLayer1List;
    }

}
