package pl.matemania.dao;

import pl.matemania.domain.User;
import pl.matemania.domain.topics.TopicLayer1;
import pl.matemania.domain.topics.TopicLayer2;
import pl.matemania.domain.topics.TopicLayer3;
import pl.matemania.domain.topics.TopicLayer4;

import java.util.List;

public interface TopicsDao {

    TopicLayer1 getSingleTopicLayer1 (int id);
    TopicLayer2 getSingleTopicLayer2 (int id);
    TopicLayer3 getSingleTopicLayer3 (int id);
    TopicLayer4 getSingleTopicLayer4 (int id);

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

    void modifyTopicLayer1Db(TopicLayer1 topicLayer1);

}
