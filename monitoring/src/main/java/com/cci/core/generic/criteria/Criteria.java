package com.cci.core.generic.criteria;

import java.util.ArrayList;
import java.util.List;
/**
 * mybatis条件
 * @author fcj
 *
 */
public class Criteria extends GeneratedCriteria {

   //排序
    protected String orderByClause;
    //去重
    protected boolean distinct;
    //条件
    protected List<Criteria> oredCriteria;
    /**
     * 通过构造实例oredCriteria
     */
    protected Criteria() {
        super();
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }
    /**
     * 添加一个criteria
     * @param criteria
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }
    /**
     * 实例一个Criteria
     * @return
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }
    /**
     * 创建一个Criteria
     * @return
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }
    /**
     * 实例一个Criteria
     * @return
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }
    /**
     * 全部清除
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }
    
    
    
    
}
