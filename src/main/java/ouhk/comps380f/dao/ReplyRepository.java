package ouhk.comps380f.dao;

import ouhk.comps380f.model.Lecture;
import ouhk.comps380f.model.Reply;
import java.util.List;

public interface ReplyRepository {
    public int createReply(Reply reply);
    public void createAttachment(Reply replay, int replyId, int topicId);
    public List<Reply> findByTopicId(int id);
    public Reply findByReplyId(int id);
    public void deleteByReplyId(int id);
}
