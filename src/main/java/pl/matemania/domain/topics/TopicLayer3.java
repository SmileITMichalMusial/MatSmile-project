package pl.matemania.domain.topics;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "topic_layer_3")

public class TopicLayer3 {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_layer_3", unique = true, nullable = false)
    private Integer idLayer3;

    @Column(name = "fk_id_layer_2", nullable = false)
    private Integer fkIdLayer2;

    @Column(name = "order_id", nullable = false)
    private Integer orderId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "comment", nullable = true)
    private String comment;

    @Column(name = "fe_menu_icon")
    private String fe_menu_icon;

    @Column(name = "fe_menu_color")
    private String fe_menu_color;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

    @Column(name = "date_created", nullable = false)
    private Date dateCreated;

    @Column(name = "date_modified", nullable = true)
    private Date dateModified;

    public TopicLayer3() {

    }

    public Integer getIdLayer3() {
        return idLayer3;
    }

    public void setIdLayer3(Integer idLayer3) {
        this.idLayer3 = idLayer3;
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

    public String getFe_menu_icon() {
        return fe_menu_icon;
    }

    public void setFe_menu_icon(String fe_menu_icon) {
        this.fe_menu_icon = fe_menu_icon;
    }

    public String getFe_menu_color() {
        return fe_menu_color;
    }

    public void setFe_menu_color(String fe_menu_color) {
        this.fe_menu_color = fe_menu_color;
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
