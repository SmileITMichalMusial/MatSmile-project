package pl.matemania.domain.topics;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "topic_layer_1")

public class TopicLayer1 {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_layer_1", unique = true, nullable = false)
    private Integer idLayer1;

    @Column(name = "order_id", nullable = false)
    private Integer orderId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "comment" )
    private String comment;


    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

    @Column(name = "date_created", nullable = false)
    private Date dateCreated;

    @Column(name = "date_modified")
    private Date dateModified;

    public TopicLayer1() {

    }

    public Integer getIdLayer1() {
        return idLayer1;
    }

    public void setIdLayer1(Integer idLayer1) {
        this.idLayer1 = idLayer1;
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
