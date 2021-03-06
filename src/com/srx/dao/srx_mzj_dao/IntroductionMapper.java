package com.srx.dao.srx_mzj_dao;

import com.srx.model.srx_mzj_model.Introduction;
import com.srx.model.srx_mzj_model.IntroductionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface IntroductionMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table introduction
     *
     * @mbg.generated Thu Dec 05 08:36:32 CST 2019
     */
    long countByExample(IntroductionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table introduction
     *
     * @mbg.generated Thu Dec 05 08:36:32 CST 2019
     */
    int deleteByExample(IntroductionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table introduction
     *
     * @mbg.generated Thu Dec 05 08:36:32 CST 2019
     */
    int deleteByPrimaryKey(Integer iid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table introduction
     *
     * @mbg.generated Thu Dec 05 08:36:32 CST 2019
     */
    int insert(Introduction record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table introduction
     *
     * @mbg.generated Thu Dec 05 08:36:32 CST 2019
     */
    int insertSelective(Introduction record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table introduction
     *
     * @mbg.generated Thu Dec 05 08:36:32 CST 2019
     */
    List<Introduction> selectByExample(IntroductionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table introduction
     *
     * @mbg.generated Thu Dec 05 08:36:32 CST 2019
     */
    Introduction selectByPrimaryKey(Integer iid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table introduction
     *
     * @mbg.generated Thu Dec 05 08:36:32 CST 2019
     */
    int updateByExampleSelective(@Param("record") Introduction record, @Param("example") IntroductionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table introduction
     *
     * @mbg.generated Thu Dec 05 08:36:32 CST 2019
     */
    int updateByExample(@Param("record") Introduction record, @Param("example") IntroductionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table introduction
     *
     * @mbg.generated Thu Dec 05 08:36:32 CST 2019
     */
    int updateByPrimaryKeySelective(Introduction record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table introduction
     *
     * @mbg.generated Thu Dec 05 08:36:32 CST 2019
     */
    int updateByPrimaryKey(Introduction record);
    List<Introduction> sel();/*��ѯר��*/
    List<Introduction> conditionSel(Integer tid);/*������ѯר��*/
    //登录验证
  	Introduction logincheck(Introduction user);
}