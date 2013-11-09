package models;

import play.db.ebean.Model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="ITEM")
public class Item extends Model {
    @Id
    @Column(name="item_number")
    public Integer id;

    @ManyToMany(mappedBy = "items")
    public List<Order> orders;
}
