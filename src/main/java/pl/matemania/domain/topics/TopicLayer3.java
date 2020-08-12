package pl.matemania.domain.topics;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "topic_layer_3")

public class TopicLayer3 {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_layer_3", unique = true, nullable = false)
    private Integer idLayer2;

    @Column(name = "fk_id_layer_2", nullable = false)
    private Integer fkIdLayer2;

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

    public TopicLayer3() {

    }

    public Integer getIdLayer2() {
        return idLayer2;
    }

    public void setIdLayer2(Integer idLayer2) {
        this.idLayer2 = idLayer2;
    }

    public Integer getFkIdLayer2() {
        return fkIdLayer2;
    }

    public void setFkIdLayer2(Integer fkIdLayer2) {
        this.fkIdLayer2 = fkIdLayer2;
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
