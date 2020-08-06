package pl.matemania.dao;

import pl.matemania.domain.topics.TopicLayer1;

import java.util.List;

public interface TopicsDao {

    TopicLayer1 getSingleTopicLayer1 (int id);

    List<TopicLayer1> getTopicLayer1FromDb();

}
