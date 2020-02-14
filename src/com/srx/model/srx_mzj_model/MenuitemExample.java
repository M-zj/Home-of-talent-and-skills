package com.srx.model.srx_mzj_model;

import java.util.ArrayList;
import java.util.List;

public class MenuitemExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    public MenuitemExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andMidIsNull() {
            addCriterion("mid is null");
            return (Criteria) this;
        }

        public Criteria andMidIsNotNull() {
            addCriterion("mid is not null");
            return (Criteria) this;
        }

        public Criteria andMidEqualTo(Integer value) {
            addCriterion("mid =", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotEqualTo(Integer value) {
            addCriterion("mid <>", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThan(Integer value) {
            addCriterion("mid >", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThanOrEqualTo(Integer value) {
            addCriterion("mid >=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThan(Integer value) {
            addCriterion("mid <", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThanOrEqualTo(Integer value) {
            addCriterion("mid <=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidIn(List<Integer> values) {
            addCriterion("mid in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotIn(List<Integer> values) {
            addCriterion("mid not in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidBetween(Integer value1, Integer value2) {
            addCriterion("mid between", value1, value2, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotBetween(Integer value1, Integer value2) {
            addCriterion("mid not between", value1, value2, "mid");
            return (Criteria) this;
        }

        public Criteria andMtitleIsNull() {
            addCriterion("mtitle is null");
            return (Criteria) this;
        }

        public Criteria andMtitleIsNotNull() {
            addCriterion("mtitle is not null");
            return (Criteria) this;
        }

        public Criteria andMtitleEqualTo(String value) {
            addCriterion("mtitle =", value, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMtitleNotEqualTo(String value) {
            addCriterion("mtitle <>", value, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMtitleGreaterThan(String value) {
            addCriterion("mtitle >", value, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMtitleGreaterThanOrEqualTo(String value) {
            addCriterion("mtitle >=", value, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMtitleLessThan(String value) {
            addCriterion("mtitle <", value, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMtitleLessThanOrEqualTo(String value) {
            addCriterion("mtitle <=", value, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMtitleLike(String value) {
            addCriterion("mtitle like", value, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMtitleNotLike(String value) {
            addCriterion("mtitle not like", value, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMtitleIn(List<String> values) {
            addCriterion("mtitle in", values, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMtitleNotIn(List<String> values) {
            addCriterion("mtitle not in", values, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMtitleBetween(String value1, String value2) {
            addCriterion("mtitle between", value1, value2, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMtitleNotBetween(String value1, String value2) {
            addCriterion("mtitle not between", value1, value2, "mtitle");
            return (Criteria) this;
        }

        public Criteria andMurlIsNull() {
            addCriterion("murl is null");
            return (Criteria) this;
        }

        public Criteria andMurlIsNotNull() {
            addCriterion("murl is not null");
            return (Criteria) this;
        }

        public Criteria andMurlEqualTo(String value) {
            addCriterion("murl =", value, "murl");
            return (Criteria) this;
        }

        public Criteria andMurlNotEqualTo(String value) {
            addCriterion("murl <>", value, "murl");
            return (Criteria) this;
        }

        public Criteria andMurlGreaterThan(String value) {
            addCriterion("murl >", value, "murl");
            return (Criteria) this;
        }

        public Criteria andMurlGreaterThanOrEqualTo(String value) {
            addCriterion("murl >=", value, "murl");
            return (Criteria) this;
        }

        public Criteria andMurlLessThan(String value) {
            addCriterion("murl <", value, "murl");
            return (Criteria) this;
        }

        public Criteria andMurlLessThanOrEqualTo(String value) {
            addCriterion("murl <=", value, "murl");
            return (Criteria) this;
        }

        public Criteria andMurlLike(String value) {
            addCriterion("murl like", value, "murl");
            return (Criteria) this;
        }

        public Criteria andMurlNotLike(String value) {
            addCriterion("murl not like", value, "murl");
            return (Criteria) this;
        }

        public Criteria andMurlIn(List<String> values) {
            addCriterion("murl in", values, "murl");
            return (Criteria) this;
        }

        public Criteria andMurlNotIn(List<String> values) {
            addCriterion("murl not in", values, "murl");
            return (Criteria) this;
        }

        public Criteria andMurlBetween(String value1, String value2) {
            addCriterion("murl between", value1, value2, "murl");
            return (Criteria) this;
        }

        public Criteria andMurlNotBetween(String value1, String value2) {
            addCriterion("murl not between", value1, value2, "murl");
            return (Criteria) this;
        }

        public Criteria andMhrefIsNull() {
            addCriterion("mhref is null");
            return (Criteria) this;
        }

        public Criteria andMhrefIsNotNull() {
            addCriterion("mhref is not null");
            return (Criteria) this;
        }

        public Criteria andMhrefEqualTo(String value) {
            addCriterion("mhref =", value, "mhref");
            return (Criteria) this;
        }

        public Criteria andMhrefNotEqualTo(String value) {
            addCriterion("mhref <>", value, "mhref");
            return (Criteria) this;
        }

        public Criteria andMhrefGreaterThan(String value) {
            addCriterion("mhref >", value, "mhref");
            return (Criteria) this;
        }

        public Criteria andMhrefGreaterThanOrEqualTo(String value) {
            addCriterion("mhref >=", value, "mhref");
            return (Criteria) this;
        }

        public Criteria andMhrefLessThan(String value) {
            addCriterion("mhref <", value, "mhref");
            return (Criteria) this;
        }

        public Criteria andMhrefLessThanOrEqualTo(String value) {
            addCriterion("mhref <=", value, "mhref");
            return (Criteria) this;
        }

        public Criteria andMhrefLike(String value) {
            addCriterion("mhref like", value, "mhref");
            return (Criteria) this;
        }

        public Criteria andMhrefNotLike(String value) {
            addCriterion("mhref not like", value, "mhref");
            return (Criteria) this;
        }

        public Criteria andMhrefIn(List<String> values) {
            addCriterion("mhref in", values, "mhref");
            return (Criteria) this;
        }

        public Criteria andMhrefNotIn(List<String> values) {
            addCriterion("mhref not in", values, "mhref");
            return (Criteria) this;
        }

        public Criteria andMhrefBetween(String value1, String value2) {
            addCriterion("mhref between", value1, value2, "mhref");
            return (Criteria) this;
        }

        public Criteria andMhrefNotBetween(String value1, String value2) {
            addCriterion("mhref not between", value1, value2, "mhref");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table menuitem
     *
     * @mbg.generated do_not_delete_during_merge Thu Dec 05 19:21:07 CST 2019
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table menuitem
     *
     * @mbg.generated Thu Dec 05 19:21:07 CST 2019
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}