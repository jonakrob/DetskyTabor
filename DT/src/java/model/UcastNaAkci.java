package model;
// Generated 13.12.2010 21:38:33 by Hibernate Tools 3.2.1.GA

/**
 * UcastNaAkci generated by hbm2java
 */
public class UcastNaAkci implements java.io.Serializable {

	private Integer id;
	private int akceId;
	private int uzivatelId;
	private int druhAkce;

	public UcastNaAkci() {
	}

	public UcastNaAkci(int akceId, int uzivatelId, int druhAkce) {
		this.akceId = akceId;
		this.uzivatelId = uzivatelId;
		this.druhAkce = druhAkce;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getAkceId() {
		return this.akceId;
	}

	public void setAkceId(int akceId) {
		this.akceId = akceId;
	}

	public int getUzivatelId() {
		return this.uzivatelId;
	}

	public void setUzivatelId(int uzivatelId) {
		this.uzivatelId = uzivatelId;
	}

	public int getDruhAkce() {
		return this.druhAkce;
	}

	public void setDruhAkce(int druhAkce) {
		this.druhAkce = druhAkce;
	}
}
