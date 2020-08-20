package pl.matemania.domain.topics;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "topic_layer_4")

public class TopicLayer4 {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_layer_4", unique = true, nullable = false)
    private Integer idLayer4;

    @Column(name = "fk_id_layer_3", nullable = false)
    private Integer fkIdLayer3;

    @Column(name = "order_id", nullable = false)
    private Integer orderId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "comment", nullable = true)
    private String comment;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

    @Column(name = "date_created", nullable = false)
    private Date dateCreated;

    @Column(name = "date_modified", nullable = true)
    private Date dateModified;

    public TopicLayer4() {

    }

    public Integer getIdLayer4() {
        return idLayer4;
    }

    public void setIdLayer4(Integer idLayer4) {
        this.idLayer4 = idLayer4;
    }

    public Integer getFkIdLayer3() {
        return fkIdLayer3;
    }

    public void setFkIdLayer3(Integer fkIdLayer3) {
        this.fkIdLayer3 = fkIdLayer3;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getDateModified() {
        return dateModified;
    }

    public void setDateModified(Date dateModified) {
        this.dateModified = dateModified;
    }
}
