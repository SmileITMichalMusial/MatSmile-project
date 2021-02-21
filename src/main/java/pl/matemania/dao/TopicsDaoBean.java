package pl.matemania.dao;

import pl.matemania.Utils.Dates;
import pl.matemania.domain.User;
import pl.matemania.domain.topics.*;

import javax.ejb.Stateless;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Stateless
public class TopicsDaoBean implements TopicsDao {

    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("primary");


    @Override
    public TopicLayer1 getSingleTopicLayer1(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        TopicLayer1 topicLayer1 = entityManager.find(TopicLayer1.class, id);
        return topicLayer1;
    }

    @Override
    public TopicLayer2 getSingleTopicLayer2(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        TopicLayer2 topicLayer2 = entityManager.find(TopicLayer2.class, id);
        return topicLayer2;
    }

    @Override
    public TopicLayer3 getSingleTopicLayer3(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        TopicLayer3 topicLayer3 = entityManager.find(TopicLayer3.class, id);
        return topicLayer3;
    }

    @Override
    public TopicLayer4 getSingleTopicLayer4(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        TopicLayer4 topicLayer4 = entityManager.find(TopicLayer4.class, id);
        return topicLayer4;
    }


    /**
     * Metoda  getTopicLayer3WithNextOrderId służy do wyszukania  obiektu typu TopicLayer3 który
     * posiada kolejny numer order_id dla powiązanej z nim warstwy drugiej (identyfikowanej przez fkIdLayer2)
     * Metoda ma dwa parametry wejściowe: orderIdLayer3 - order_id dla warstwy trzeciej i fkIdLayer2 - klucz obcy
     * identyfikujący warstwę drugą
     * <p>
     * Na początku metody sprawdzamy czy istnieje kolejny order_id dla danego orderid warstwy trzeciej i powiązanej z nim warstwy drugiej
     * Jeśli nie ustnieje to zwrata obiekt TopicLayer3 jako null, jesli istnieje to wyszukuje TopicLayer3 z kolejnym order_id
     * <p>
     * get(0) nigdy nie zwróci błędu gdyż albo istnieje kolejny (sprawdzoen przez nextExists) albo jest to null
     * Para fkIdLayer2 i orderIdLayer3 jest unikalna na bazie danych (klucz unique_orderid_layer_3)
     *
     * @param orderIdLayer3 order_id warstwy trzeciej
     * @param fkIdLayer2    identyfikator warstwy drugiej
     * @return obiekt TopicLayer3 albo null (jesli nie istnieje kolejny)
     */


    @Override
    public TopicLayer3 getTopicLayer3WithNextOrderId(int orderIdLayer3, int fkIdLayer2) {
        List<TopicLayer3> topicLayer3List = getTopicLayer3FromDbSortedByOrderId();

        boolean nextExists = topicLayer3List
                .stream()
                .anyMatch(r -> r.getFkIdLayer2().equals(fkIdLayer2) && r.getOrderId() > orderIdLayer3);

        TopicLayer3 topicLayer3;
        if (!nextExists) {
            topicLayer3 = null;
        } else {
            topicLayer3 = topicLayer3List
                    .stream()
                    .filter(d -> d.getFkIdLayer2().equals(fkIdLayer2) && d.getOrderId() > orderIdLayer3)
                    .sorted(Comparator.comparing(TopicLayer3::getOrderId))
                    .collect(Collectors.toList())
                    .get(0);
        }

        return topicLayer3;

    }

    /**
     * Metoda  getTopicLayer3WithPreviousOrderId służy do wyszukania  obiektu typu TopicLayer3 który
     * posiada poprzedni numer order_id dla powiązanej z nim warstwy drugiej (identyfikowanej przez fkIdLayer2)
     * Metoda ma dwa parametry wejściowe: orderIdLayer3 - order_id dla warstwy trzeciej i fkIdLayer2 - klucz obcy
     * identyfikujący warstwę drugą
     * <p>
     * Na początku metody sprawdzamy czy istnieje poprzedni order_id dla danego orderid warstwy trzeciej i powiązanej z nim warstwy drugiej
     * Jeśli nie ustnieje to zwrata obiekt TopicLayer3 jako null, jesli istnieje to wyszukuje TopicLayer3 z kolejnym order_id
     * <p>
     * get(0) nigdy nie zwróci błędu gdyż albo istnieje poprzedni (sprawdzoen przez nextExists) albo jest to null
     * Para fkIdLayer2 i orderIdLayer3 jest unikalna na bazie danych (klucz unique_orderid_layer_3)
     *
     * @param orderIdLayer3 order_id warstwy trzeciej
     * @param fkIdLayer2    identyfikator warstwy drugiej
     * @return obiekt TopicLayer3 albo null (jesli nie istnieje poprzedni)
     */

    @Override
    public TopicLayer3 getTopicLayer3WithPreviousOrderId(int orderIdLayer3, int fkIdLayer2) {
        List<TopicLayer3> topicLayer3List = getTopicLayer3FromDbSortedByOrderId();

        boolean previousExists = topicLayer3List
                .stream()
                .anyMatch(p -> p.getFkIdLayer2().equals(fkIdLayer2) && p.getOrderId() < orderIdLayer3);

        TopicLayer3 topicLayer3;
        if (!previousExists) {
            topicLayer3 = null;
        } else {
            topicLayer3 = topicLayer3List
                    .stream()
                    .filter(d -> d.getFkIdLayer2().equals(fkIdLayer2) && d.getOrderId() < orderIdLayer3)
                    .sorted(Comparator.comparing(TopicLayer3::getOrderId).reversed())
                    .collect(Collectors.toList())
                    .get(0);
        }


        return topicLayer3;

    }


    @Override
    public void markTopicLayer1AsInactiveInDb(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        TopicLayer1 topicLayer1 = getSingleTopicLayer1(id);
        System.out.println("TopicLayer1 id: " + id);
        System.out.println("TopicLayer1 status: " + topicLayer1.getActive());
        System.out.println("Setting up as inactive...");
        topicLayer1.setActive(false);
        topicLayer1.setDateModified(Dates.getCurrentDateForDbModifications());
        System.out.println("TopicLayer1 status: " + topicLayer1.getActive());
        entityManager.merge(topicLayer1);
        entityTransaction.commit();
        entityManager.close();


    }

    @Override
    public void markTopicLayer1AsActiveInDb(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        TopicLayer1 topicLayer1 = getSingleTopicLayer1(id);
        System.out.println("TopicLayer1 id: " + id);
        System.out.println("TopicLayer1 status: " + topicLayer1.getActive());
        System.out.println("Setting up as inactive...");
        topicLayer1.setActive(true);
        topicLayer1.setDateModified(Dates.getCurrentDateForDbModifications());
        System.out.println("TopicLayer1 status: " + topicLayer1.getActive());
        entityManager.merge(topicLayer1);
        entityTransaction.commit();
        entityManager.close();


    }

    @Override
    public void markTopicLayer2AsInactiveInDb(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        TopicLayer2 topicLayer2 = getSingleTopicLayer2(id);
        System.out.println("TopicLayer2 id: " + id);
        System.out.println("TopicLayer2 status: " + topicLayer2.getActive());
        System.out.println("Setting up as inactive...");
        topicLayer2.setActive(false);
        topicLayer2.setDateModified(Dates.getCurrentDateForDbModifications());
        System.out.println("TopicLayer1 status: " + topicLayer2.getActive());
        entityManager.merge(topicLayer2);
        entityTransaction.commit();
        entityManager.close();


    }

    @Override
    public void markTopicLayer2AsActiveInDb(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        TopicLayer2 topicLayer2 = getSingleTopicLayer2(id);
        System.out.println("TopicLayer2 id: " + id);
        System.out.println("TopicLayer2 status: " + topicLayer2.getActive());
        System.out.println("Setting up as inactive...");
        topicLayer2.setActive(true);
        topicLayer2.setDateModified(Dates.getCurrentDateForDbModifications());
        System.out.println("TopicLayer2 status: " + topicLayer2.getActive());
        entityManager.merge(topicLayer2);
        entityTransaction.commit();
        entityManager.close();


    }

    @Override
    public void markTopicLayer3AsInactiveInDb(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        TopicLayer3 topicLayer3 = getSingleTopicLayer3(id);
        System.out.println("TopicLayer3 id: " + id);
        System.out.println("TopicLayer3 status: " + topicLayer3.getActive());
        System.out.println("Setting up as inactive...");
        topicLayer3.setActive(false);
        topicLayer3.setDateModified(Dates.getCurrentDateForDbModifications());
        System.out.println("TopicLayer3 status: " + topicLayer3.getActive());
        entityManager.merge(topicLayer3);
        entityTransaction.commit();
        entityManager.close();


    }

    @Override
    public void markTopicLayer3AsActiveInDb(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        TopicLayer3 topicLayer3 = getSingleTopicLayer3(id);
        System.out.println("TopicLayer3 id: " + id);
        System.out.println("TopicLayer3 status: " + topicLayer3.getActive());
        System.out.println("Setting up as inactive...");
        topicLayer3.setActive(true);
        topicLayer3.setDateModified(Dates.getCurrentDateForDbModifications());
        System.out.println("TopicLayer3 status: " + topicLayer3.getActive());
        entityManager.merge(topicLayer3);
        entityTransaction.commit();
        entityManager.close();


    }

    @Override
    public void markTopicLayer4AsInactiveInDb(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        TopicLayer4 topicLayer4 = getSingleTopicLayer4(id);
        System.out.println("TopicLayer4 id: " + id);
        System.out.println("TopicLayer4 status: " + topicLayer4.getActive());
        System.out.println("Setting up as inactive...");
        topicLayer4.setActive(false);
        topicLayer4.setDateModified(Dates.getCurrentDateForDbModifications());
        System.out.println("TopicLayer4 status: " + topicLayer4.getActive());
        entityManager.merge(topicLayer4);
        entityTransaction.commit();
        entityManager.close();


    }

    @Override
    public void markTopicLayer4AsActiveInDb(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        TopicLayer4 topicLayer4 = getSingleTopicLayer4(id);
        System.out.println("TopicLayer4 id: " + id);
        System.out.println("TopicLayer4 status: " + topicLayer4.getActive());
        System.out.println("Setting up as inactive...");
        topicLayer4.setActive(true);
        topicLayer4.setDateModified(Dates.getCurrentDateForDbModifications());
        System.out.println("TopicLayer4 status: " + topicLayer4.getActive());
        entityManager.merge(topicLayer4);
        entityTransaction.commit();
        entityManager.close();


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

    @Override
    public List<TopicLayer4> getTopicLayer4FromDbSortedByOrderId() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer4> topicLayer4List = entityManager.createQuery("FROM TopicLayer4 ").getResultList();
        topicLayer4List = topicLayer4List
                .stream()
                .sorted(Comparator.comparing(TopicLayer4::getOrderId))
                .collect(Collectors.toList());

        return topicLayer4List;
    }

    @Override
    public List<TopicLayer1> getTopicLayer1FromDbActiveSortedByOrderId() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer1> topicLayer1ListActive = entityManager.createQuery("FROM TopicLayer1 ").getResultList();
        topicLayer1ListActive = topicLayer1ListActive
                .stream()
                .filter(p -> p.getActive())
                .sorted(Comparator.comparing(TopicLayer1::getOrderId))
                .collect(Collectors.toList());

        return topicLayer1ListActive;
    }

    @Override
    public List<TopicLayer2> getTopicLayer2FromDbActiveSortedByOrderId() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer2> topicLayer2ListActive = entityManager.createQuery("FROM TopicLayer2 ").getResultList();
        topicLayer2ListActive = topicLayer2ListActive
                .stream()
                .filter(p -> p.getActive())
                .sorted(Comparator.comparing(TopicLayer2::getOrderId))
                .collect(Collectors.toList());

        return topicLayer2ListActive;
    }

    @Override
    public List<TopicLayer3> getTopicLayer3FromDbActiveSortedByOrderId() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer3> topicLayer3ListActive = entityManager.createQuery("FROM TopicLayer3 ").getResultList();
        topicLayer3ListActive = topicLayer3ListActive
                .stream()
                .filter(p -> p.getActive())
                .sorted(Comparator.comparing(TopicLayer3::getOrderId))
                .collect(Collectors.toList());

        return topicLayer3ListActive;
    }

    @Override
    public List<TopicLayer4> getTopicLayer4FromDbActiveSortedByOrderId() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer4> topicLayer4ListActive = entityManager.createQuery("FROM TopicLayer4 ").getResultList();
        topicLayer4ListActive = topicLayer4ListActive
                .stream()
                .filter(p -> p.getActive())
                .sorted(Comparator.comparing(TopicLayer4::getOrderId))
                .collect(Collectors.toList());

        return topicLayer4ListActive;
    }


    /**
     * Metoda  getTopicLayer4GroupForTopicLayer3Id pobiera całą grupę warstwy 4 wraz z zawartoscia do wyswietlenia na steonie.
     * Jest to jedyne miejsce gdzie pobieramy kontent warstwy 4
     * Wybiera tylko aktywne, sortuje po orderId
     *
     * @param fk_id_layer_3 fk_id_layer_3 z tabeli topic_layer_3 (klasa TopicLayer3, identyfikaotr warstwy 3
     * @return obiekt Lista TopicLayer4 dla danego fk_id_layer_3
     */


    @Override
    public List<TopicLayer4> getTopicLayer4GroupForTopicLayer3Id(int fk_id_layer_3) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer4> topicLayer4GroupForTopicLayer3Id = entityManager.createQuery("FROM TopicLayer4 ").getResultList();
        topicLayer4GroupForTopicLayer3Id = topicLayer4GroupForTopicLayer3Id
                .stream()
                .filter(p -> p.getActive())
                .filter(l -> l.getFkIdLayer3().equals(fk_id_layer_3))
                .sorted(Comparator.comparing(TopicLayer4::getOrderId))
                .collect(Collectors.toList());

        return topicLayer4GroupForTopicLayer3Id;
    }


    @Override
    public List<TopicLayer4WithoutContent> getTopicLayer4FromDbActiveWithoutContentSortedByOrderId() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer4WithoutContent> topicLayer4ListActiveWithoutContent = entityManager.createQuery("FROM TopicLayer4WithoutContent ").getResultList();
        topicLayer4ListActiveWithoutContent = topicLayer4ListActiveWithoutContent
                .stream()
                .filter(p -> p.getActive())
                .sorted(Comparator.comparing(TopicLayer4WithoutContent::getOrderId))
                .collect(Collectors.toList());

        return topicLayer4ListActiveWithoutContent;
    }

    @Override
    public List<TopicLayer4WithoutContent> getTopicLayer4FromDbWithoutContentSortedByOrderId() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        List<TopicLayer4WithoutContent> topicLayer4ListActiveWithoutContent = entityManager.createQuery("FROM TopicLayer4WithoutContent ").getResultList();
        topicLayer4ListActiveWithoutContent = topicLayer4ListActiveWithoutContent
                .stream()
                .sorted(Comparator.comparing(TopicLayer4WithoutContent::getOrderId))
                .collect(Collectors.toList());

        return topicLayer4ListActiveWithoutContent;
    }


    @Override
    public void modifyTopicLayer1Db(TopicLayer1 topicLayer1) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        entityManager.merge(topicLayer1);
        entityTransaction.commit();
        entityManager.close();
    }

    @Override
    public void modifyTopicLayer2Db(TopicLayer2 topicLayer2) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        entityManager.merge(topicLayer2);
        entityTransaction.commit();
        entityManager.close();
    }

    @Override
    public void modifyTopicLayer3Db(TopicLayer3 topicLayer3) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        entityManager.merge(topicLayer3);
        entityTransaction.commit();
        entityManager.close();
    }

    @Override
    public void modifyTopicLayer4Db(TopicLayer4 topicLayer4) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        entityManager.merge(topicLayer4);
        entityTransaction.commit();
        entityManager.close();
    }

    @Override
    public void saveTopicLayer1ToDb(TopicLayer1 topicLayer1) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.persist(topicLayer1);
        transaction.commit();
        entityManager.close();
    }

    @Override
    public void saveTopicLayer2ToDb(TopicLayer2 topicLayer2) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.persist(topicLayer2);
        transaction.commit();
        entityManager.close();
    }

    @Override
    public void saveTopicLayer3ToDb(TopicLayer3 topicLayer3) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.persist(topicLayer3);
        transaction.commit();
        entityManager.close();
    }

    @Override
    public void saveTopicLayer4ToDb(TopicLayer4 topicLayer4) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.persist(topicLayer4);
        transaction.commit();
        entityManager.close();
    }

    @Override
    public boolean layer1ContainsLayer2Records(String id_layer_1) {

        return this.getTopicLayer2FromDbSortedByOrderId()
                .stream()
                .anyMatch(t -> t.getFkIdLayer1().equals(id_layer_1));
    }


}
