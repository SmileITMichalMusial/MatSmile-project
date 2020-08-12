package pl.matemania.domain.topics;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "topic_layer_2")

public class TopicLayer2 {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_layer_2", unique = true, nullable = false)
    private Integer idLayer2;

    @Column(name = "fk_id_layer_1", nullable = false)
    private Integer fkIdLayer1;

    @Column(name = "order_id", nullable = false)
    private Integer orderId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "comment", nullable = true)
    private String comment;


    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

    @Column(name = "date_created", nullable = false)
    private Date dateCreated;

    @Column(name = "date_modified", nullable = true)
    private Date dateModified;

    public TopicLayer2() {

    }

    public Integer getIdLayer2() {
        return idLayer2;
    }

    public void setIdLayer2(Integer idLayer2) {
        this.idLayer2 = idLayer2;
    }

    public Integer getFkIdLayer1() {
        return fkIdLayer1;
    }

    public void setFkIdLayer1(Integer fkIdLayer1) {
        this.fkIdLayer1 = fkIdLayer1;
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
