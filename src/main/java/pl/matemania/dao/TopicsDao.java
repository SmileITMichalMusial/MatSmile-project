package pl.matemania.dao;

import pl.matemania.domain.topics.TopicLayer1;
import pl.matemania.domain.topics.TopicLayer2;
import pl.matemania.domain.topics.TopicLayer3;

import java.util.List;

public interface TopicsDao {

    TopicLayer1 getSingleTopicLayer1 (int id);
    TopicLayer2 getSingleTopicLayer2 (int id);
    TopicLayer3 getSingleTopicLayer3 (int id);

    List<TopicLayer1> getTopicLayer1FromDbSortedByOrderId();
    List<TopicLayer2> getTopicLayer2FromDbSortedByOrderId();
    List<TopicLayer3> getTopicLayer3FromDbSortedByOrderId();

}
