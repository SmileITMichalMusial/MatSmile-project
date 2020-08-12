package pl.matemania.dao;

import pl.matemania.domain.topics.TopicLayer1;
import pl.matemania.domain.topics.TopicLayer2;
import pl.matemania.domain.topics.TopicLayer3;

import javax.ejb.Stateless;
import javax.persistence.*;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

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
    public TopicLayer2 getSingleTopicLayer2(int id1) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        TopicLayer2 topicLayer2 = entityManager.find(TopicLayer2.class, id1);
        return topicLayer2;
    }

    @Override
    public TopicLayer3 getSingleTopicLayer3(int id1) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        TopicLayer3 topicLayer3 = entityManager.find(TopicLayer3.class, id1);
        return topicLayer3;
    }


    @Override
    public List<TopicLayer1> getTopicLayer1FromDbSortedByOrderId() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer1> topicLayer1List = entityManager.createQuery("FROM TopicLayer1 ").getResultList();
        topicLayer1List = topicLayer1List
                .stream()
                .sorted(Comparator.comparing(TopicLayer1::getOrderId))
                .collect(Collectors.toList());



        return topicLayer1List;
    }

    @Override
    public List<TopicLayer2> getTopicLayer2FromDbSortedByOrderId() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer2> topicLayer2List = entityManager.createQuery("FROM TopicLayer2 ").getResultList();
        topicLayer2List = topicLayer2List
                .stream()
                .sorted(Comparator.comparing(TopicLayer2::getOrderId))
                .collect(Collectors.toList());

        return topicLayer2List;
    }

    @Override
    public List<TopicLayer3> getTopicLayer3FromDbSortedByOrderId() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer3> topicLayer3List = entityManager.createQuery("FROM TopicLayer3 ").getResultList();
        topicLayer3List = topicLayer3List
                .stream()
                .sorted(Comparator.comparing(TopicLayer3::getOrderId))
                .collect(Collectors.toList());

        return topicLayer3List;
    }

}
