package model;
// Generated 13.12.2010 21:38:33 by Hibernate Tools 3.2.1.GA



/**
 * Role generated by hbm2java
 */
public class Role  implements java.io.Serializable {


     private Integer id;
     private String nazev;

    public Role() {
    }

    public Role(String nazev) {
       this.nazev = nazev;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getNazev() {
        return this.nazev;
    }
    
    public void setNazev(String nazev) {
        this.nazev = nazev;
    }




}


