<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package.Mapper}.${table.mapperName}">

<!-- 通用设置 -->
<#if baseColumnList>
    <!-- 通用查询列 -->
    <sql id="Base_Column_List">
        <#list table.commonFields as field>
            ${field.name},
        </#list>
        ${table.fieldNames}
    </sql>

    <!-- 通用条件列 -->
    <sql id="${entity}ByCondition">
    <#list table.fields as field>
        <#if field.propertyType == "LocalDateTime" || field.propertyType == "LocalDate"><#--生成普通字段 -->
            <if test="${field.propertyName}!=null">
                AND ${field.name} = ${r"#{"}${field.propertyName}${r"}"}
            </if>
        </#if>
        <#if field.propertyType != "LocalDateTime" && field.propertyType != "LocalDate"><#--生成普通字段 -->
            <if test="${field.propertyName}!=null and ${field.propertyName}!=''">
                AND ${field.name} = ${r"#{"}${field.propertyName}${r"}"}
            </if>
        </#if>
    </#list>
    </sql>

    <!-- 通用设置列 -->
    <sql id="${entity}SetColumns">
    <#list table.fields as field>
        <#if !field.keyFlag><#--生成普通字段 -->
        <#if field.propertyType == "LocalDateTime" || field.propertyType == "LocalDate">
            <if test="${field.propertyName}!=null">
                ${field.name} = ${r"#{"}${field.propertyName}${r"}"},
            </if>
        </#if>
        <#if field.propertyType != "LocalDateTime" && field.propertyType != "LocalDate">
            <if test="${field.propertyName}!=null and ${field.propertyName}!=''">
                ${field.name} = ${r"#{"}${field.propertyName}${r"}"},
            </if>
        </#if>
        </#if>
    </#list>
    </sql>
    </#if>

    <#if baseResultMap>
    <!-- 通用查询映射结果 -->
    <resultMap id="${entity}Map" type="${package.Entity}.${entity}">
    <#list table.fields as field>
        <#if field.keyFlag><#--生成主键排在第一位-->
            <id column="${field.name}" property="${field.propertyName}"/>
        </#if>
    </#list>
    <#list table.commonFields as field><#--生成公共字段 -->
        <result column="${field.name}" property="${field.propertyName}"/>
    </#list>
    <#list table.fields as field>
        <#if !field.keyFlag><#--生成普通字段 -->
            <result column="${field.name}" property="${field.propertyName}"/>
        </#if>
    </#list>
    </resultMap>
    </#if>

    <!-- 查询表${table.name}所有信息 -->
    <select id="findAll${entity}" resultMap="${entity}Map">
        SELECT
        <include refid="Base_Column_List"/>
        FROM ${table.name}
    </select>

<#list table.fields as field>
<#if field.keyFlag>
    <!-- 根据主键${field.propertyName}查询表${table.name}信息 -->
    <select id="find${entity}By${field.propertyName}" resultMap="${entity}Map">
        SELECT
        <include refid="Base_Column_List"/>
        FROM ${table.name}
        WHERE ${field.name}=${r"#{"}${field.propertyName}${r"}"}
    </select>
</#if>
</#list>

    <!-- 根据条件查询表${table.name}信息 -->
    <select id="find${entity}ByCondition" resultMap="${entity}Map">
        SELECT
        <include refid="Base_Column_List"/>
        FROM ${table.name}
        WHERE 1=1
        <include refid="${entity}ByCondition" />
    </select>

<#list table.fields as field>
<#if field.keyFlag>
    <!-- 根据主键${field.propertyName}删除表${table.name}信息 -->
    <delete id="delete${entity}By${field.propertyName}">
        DELETE FROM
        ${table.name}
        WHERE ${field.name}=${r"#{"}${field.propertyName}${r"}"}
    </delete>
</#if>
</#list>

<#list table.fields as field>
<#if field.keyFlag>
    <!-- 根据主键${field.propertyName}更新表${table.name}信息 -->
    <update id="update${entity}By${field.propertyName}" parameterType="${package.Entity}.${entity}">
        UPDATE ${table.name}
        <set>
            <include refid="${entity}SetColumns"/>
        </set>
        WHERE
        <#list table.fields as field><#if field.keyFlag>${field.name}=${r"#{"}${field.propertyName}${r"}"}</#if></#list>
    </update>
</#if>
</#list>

<#list table.fields as field>
<#if field.keyFlag>
    <!-- 新增表${table.name}信息 -->
    <insert id="add${entity}">
        INSERT INTO ${table.name} (
        <#list table.fields as field>
            <#if field_index gt 0>,</#if>${field.name}
        </#list>
        ) VALUES (
        <#list table.fields as field>
            <#if field_index gt 0>,</#if>${r"#{"}${field.propertyName}${r"}"}
        </#list>
        )
    </insert>
</#if>
</#list>
</mapper>
