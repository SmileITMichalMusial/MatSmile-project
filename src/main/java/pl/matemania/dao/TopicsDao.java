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
    void markTopicLayer2AsActiveInDb(int id);

    List<TopicLayer1> getTopicLayer1FromDbSortedByOrderId();
    List<TopicLayer2> getTopicLayer2FromDbSortedByOrderId();
    List<TopicLayer3> getTopicLayer3FromDbSortedByOrderId();
    List<TopicLayer4> getTopicLayer4FromDbSortedByOrderId();

    void modifyTopicLayer1Db(TopicLayer1 topicLayer1);

}
