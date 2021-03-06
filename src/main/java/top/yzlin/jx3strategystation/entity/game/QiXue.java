package top.yzlin.jx3strategystation.entity.game;


import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;
import java.util.Arrays;

@Entity
@Table(name = "qiXue")
public class QiXue {
    public static final Skill PASSIVE = null;
    private int qiXueId;
    private String name;
    private String describe;
    private String imgBase64;
    private SkillType[] skillTypes;
    private Skill skill = PASSIVE;

    public static Skill getPASSIVE() {
        return PASSIVE;
    }

    public void setSkillTypes(SkillType[] skillTypes) {
        this.skillTypes = skillTypes;
    }

    @OrderColumn
    @OneToMany(targetEntity = SkillType.class)
    @Cascade(CascadeType.MERGE)
    public SkillType[] getSkillTypes() {
        return skillTypes;
    }

    public void setQiXueId(int qiXueId) {
        this.qiXueId = qiXueId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    @Id
    @GeneratedValue
    public int getQiXueId() {
        return qiXueId;
    }

    @OrderColumn
    @OneToOne(targetEntity = Skill.class)
    @Cascade(CascadeType.MERGE)
    public Skill getSkill() {
        return skill;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    public String getImgBase64() {
        return imgBase64;
    }

    public void setImgBase64(String imgBase64) {
        this.imgBase64 = imgBase64;
    }

    @Override
    public String toString() {
        return "QiXue{" +
                "qiXueId=" + qiXueId +
                ", name='" + name + '\'' +
                ", describe='" + describe + '\'' +
                ", imgBase64='" + imgBase64 + '\'' +
                ", skillTypes=" + Arrays.toString(skillTypes) +
                ", skill=" + skill +
                '}';
    }
}
