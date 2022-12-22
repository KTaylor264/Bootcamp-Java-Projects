package com.kendelltaylor.hmcalc.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="digimons")
public class Digimon {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	private String diginame;
	private int hp_stat;
	private int sp_stat;
	private int atk_stat;
	private int def_stat;
	private int int_stat;
	private int spd_stat;
	private int is_royal;
	private int items;
	
    // This will not allow the createdAt column to be updated after creation
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="stage_id")
    private Stage stage;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="growth_type_id")
    private GrowthType growthType;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="type_id")
    private Type type;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="attribute_id")
    private Attribute attribute;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="support_skill_id")
    private SupportSkill supportSkill;
    
    public Digimon() {
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDiginame() {
		return diginame;
	}

	public void setDiginame(String diginame) {
		this.diginame = diginame;
	}

	public int getHp_stat() {
		return hp_stat;
	}

	public void setHp_stat(int hp_stat) {
		this.hp_stat = hp_stat;
	}

	public int getSp_stat() {
		return sp_stat;
	}

	public void setSp_stat(int sp_stat) {
		this.sp_stat = sp_stat;
	}

	public int getAtk_stat() {
		return atk_stat;
	}

	public void setAtk_stat(int atk_stat) {
		this.atk_stat = atk_stat;
	}

	public int getDef_stat() {
		return def_stat;
	}

	public void setDef_stat(int def_stat) {
		this.def_stat = def_stat;
	}

	public int getInt_stat() {
		return int_stat;
	}

	public void setInt_stat(int int_stat) {
		this.int_stat = int_stat;
	}

	public int getSpd_stat() {
		return spd_stat;
	}

	public void setSpd_stat(int spd_stat) {
		this.spd_stat = spd_stat;
	}

	public int getIs_royal() {
		return is_royal;
	}

	public void setIs_royal(int is_royal) {
		this.is_royal = is_royal;
	}

	public int getItems() {
		return items;
	}

	public void setItems(int items) {
		this.items = items;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}

	public GrowthType getGrowthType() {
		return growthType;
	}

	public void setGrowthType(GrowthType growthType) {
		this.growthType = growthType;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Attribute getAttribute() {
		return attribute;
	}

	public void setAttribute(Attribute attribute) {
		this.attribute = attribute;
	}

	public SupportSkill getSupportSkill() {
		return supportSkill;
	}

	public void setSupportSkill(SupportSkill supportSkill) {
		this.supportSkill = supportSkill;
	}
}
