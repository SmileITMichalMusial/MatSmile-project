package pl.matemania.dao;

import pl.matemania.domain.User;
import pl.matemania.domain.topics.*;

import java.util.ArrayList;
import java.util.List;

public interface TopicsDao {

    TopicLayer1 getSingleTopicLayer1 (int id);
    TopicLayer2 getSingleTopicLayer2 (int id);
    TopicLayer3 getSingleTopicLayer3 (int id);
    TopicLayer4 getSingleTopicLayer4 (int id);

    TopicLayer3 getTopicLayer3WithNextOrderId (int orderIdLayer3, int fkIdLayer2);
    TopicLayer3 getTopicLayer3WithPreviousOrderId (int orderIdLayer3, int fkIdLayer2);

    void markTopicLayer1AsInactiveInDb(int id);
    void markTopicLayer1AsActiveInDb(int id);
    void markTopicLayer2AsInactiveInDb(int id);
    void markTopicLayer2AsActiveInDb(int id);
    void markTopicLayer3AsInactiveInDb(int id);
    void markTopicLayer3AsActiveInDb(int id);
    void markTopicLayer4AsInactiveInDb(int id);
    void markTopicLayer4AsActiveInDb(int id);

    List<TopicLayer1> getTopicLayer1FromDbSortedByOrderId();
    List<TopicLayer2> getTopicLayer2FromDbSortedByOrderId();
    List<TopicLayer3> getTopicLayer3FromDbSortedByOrderId();
    List<TopicLayer4> getTopicLayer4FromDbSortedByOrderId();

    List<TopicLayer1> getTopicLayer1FromDbActiveSortedByOrderId();
    List<TopicLayer2> getTopicLayer2FromDbActiveSortedByOrderId();
    List<TopicLayer3> getTopicLayer3FromDbActiveSortedByOrderId();
    List<TopicLayer4> getTopicLayer4FromDbActiveSortedByOrderId();

    List<TopicLayer4> getTopicLayer4GroupForTopicLayer3Id(int fk_id_layer_3);
    List<TopicLayer4WithoutContent> getTopicLayer4FromDbWithoutContentSortedByOrderId();
    List<TopicLayer4WithoutContent> getTopicLayer4FromDbActiveWithoutContentSortedByOrderId();

    void modifyTopicLayer1Db(TopicLayer1 topicLayer1);
    void modifyTopicLayer2Db(TopicLayer2 topicLayer2);
    void modifyTopicLayer3Db(TopicLayer3 topicLayer3);
    void modifyTopicLayer4Db(TopicLayer4 topicLayer4);

    void saveTopicLayer1ToDb(TopicLayer1 topicLayer1);
    void saveTopicLayer2ToDb(TopicLayer2 topicLayer2);
    void saveTopicLayer3ToDb(TopicLayer3 topicLayer3);
    void saveTopicLayer4ToDb(TopicLayer4 topicLayer4);

    boolean layer1ContainsLayer2Records (String id_layer_1);



}
