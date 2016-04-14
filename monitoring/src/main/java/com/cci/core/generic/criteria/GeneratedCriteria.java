package com.cci.core.generic.criteria;

import java.util.ArrayList;
import java.util.List;

/**
 * 把条件存放到“标准”集合
 * @author fcj
 *
 */
abstract class GeneratedCriteria {
    protected List<Criterion> criteria;

    protected GeneratedCriteria() {
        super();
        criteria = new ArrayList<Criterion>();
    }
    /**
     * List<Criterion>是否大于0
     * @return
     */
    public boolean isValid() {
        return criteria.size() > 0;
    }
    /**
     * 得到一个List<Criterion>
     * @return
     */
    public List<Criterion> getAllCriteria() {
        return criteria;
    }
    /**
     * 得到一个List<Criterion>
     * @return
     */
    public List<Criterion> getCriteria() {
        return criteria;
    }
    /**
     * 添加一个条件
     * @param condition
     */
    protected void addCriterion(String condition) {
        if (condition == null) {
            throw new RuntimeException("Value for condition cannot be null");
        }
        criteria.add(new Criterion(condition));
    }
    /**
     * 添加一个条件
     * @param condition 条件
     * @param value  值
     * @param property 参数
     */
    protected void addCriterion(String condition, Object value, String property) {
        if (value == null) {
            throw new RuntimeException("Value for " + property + " cannot be null");
        }
        criteria.add(new Criterion(condition, value));
    }
    
    /**
     * 添加一个条件
     * @param condition 条件
     * @param value  值
     * @param value  值
     * @param property 参数
     */
    protected void addCriterion(String condition, Object value1, Object value2, String property) {
        if (value1 == null || value2 == null) {
            throw new RuntimeException("Between values for " + property + " cannot be null");
        }
        criteria.add(new Criterion(condition, value1, value2));
    }
    /**
     * name为空
     * @param name
     * @return
     */
    public Criteria andIsNull(String name) {
        addCriterion(name+" is null");
        return (Criteria) this;
    }
    /**
     * name不为空
     * @param name
     * @return
     */
    public Criteria andIsNotNull(String name) {
        addCriterion(name+" is not null");
        return (Criteria) this;
    }
    /**
     * name等于value
     * @param name
     * @param value
     * @return
     */
    public Criteria andEqualTo(String name,Object value) {
        addCriterion(name+" =", value, name);
        return (Criteria) this;
    }
    /**
     * name不等于value
     * @param name
     * @param value
     * @return
     */
    public Criteria andNotEqualTo(String name,Object value) {
        addCriterion(name+" <>", value, name);
        return (Criteria) this;
    }
    /**
     * name大于value
     * @param name
     * @param value
     * @return
     */
    public Criteria andGreaterThan(String name,Object value) {
        addCriterion(name+" >", value, name);
        return (Criteria) this;
    }
    /**
     * name大于等于value
     * @param name
     * @param value
     * @return
     */
    public Criteria andGreaterThanOrEqualTo(String name,Object value) {
        addCriterion(name+" >=", value, name);
        return (Criteria) this;
    }
    /**
     * name小于value
     * @param name
     * @param value
     * @return
     */
    public Criteria andLessThan(String name,Object value) {
        addCriterion(name+" <", value, name);
        return (Criteria) this;
    }
    /**
     * name小于等于value
     * @param name
     * @param value
     * @return
     */
    public Criteria andLessThanOrEqualTo(String name,Object value) {
        addCriterion(name+" <=", value, name);
        return (Criteria) this;
    }
    /**
     * In value
     * @param name
     * @param values
     * @return
     */
    public Criteria andIn(String name,List<Object> values) {
        addCriterion(name+" in", values, name);
        return (Criteria) this;
    }
    /**
     * Not IN value
     * @param name
     * @param values
     * @return
     */
    public Criteria andNotIn(String name,List<Object> values) {
        addCriterion(name+" not in", values, name);
        return (Criteria) this;
    }
    /**
     * name在value1到value2之间
     * @param name
     * @param value1
     * @param value2
     * @return
     */
    public Criteria andBetween(String name,Object value1, Object value2) {
        addCriterion(name+" between", value1, value2, name);
        return (Criteria) this;
    }
    /**
     * name不在value1到value2之间
     * @param name
     * @param value1
     * @param value2
     * @return
     */
    public Criteria andNotBetween(String name,Object value1, Object value2) {
        addCriterion(name+" not between", value1, value2, name);
        return (Criteria) this;
    }
    /**
     * name Like 值
     * @param name
     * @param value
     * @return
     */
    public Criteria andLike(String name,Object value) {
        addCriterion(name+" like", value, name);
        return (Criteria) this;
    }
    /**
     * name Not Like 值
     * @param name
     * @param value
     * @return
     */
    public Criteria andNotLike(String name,Object value) {
        addCriterion(name+" not like", value, name);
        return (Criteria) this;
    }


}