package ${package.ServiceImpl};

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Service
public class ${table.serviceImplName} implements ${table.serviceName} {
	
	@Autowired
	private ${table.mapperName} ${table.entityPath}Mapper;

	/**
	*  查询表${table.name}所有信息
	*/
	@Override
	public List<${entity}> findAll${entity}() { return ${table.entityPath}Mapper.findAll${entity}();}

<#list table.fields as field>
<#if field.keyFlag>
	/**
	*  根据主键${field.propertyName}查询表${table.name}信息
	*  @param ${field.propertyName}
	*/
	@Override
	public ${entity} find${entity}By${field.propertyName}(@Param("${field.propertyName}") ${field.propertyType} ${field.propertyName}) { return ${table.entityPath}Mapper.find${entity}By${field.propertyName}(${field.propertyName});}
</#if>
</#list>

	/**
	*  根据条件查询表${table.name}信息
	*  @param ${table.entityPath}
	*/
	@Override
	public List<${entity}> find${entity}ByCondition(${entity} ${table.entityPath}) { return ${table.entityPath}Mapper.find${entity}ByCondition(${table.entityPath});}

<#list table.fields as field>
<#if field.keyFlag>
	/**
	*  根据主键${field.propertyName}查询表${table.name}信息
	*  @param ${field.propertyName}
	*/
	@Override
	public Integer delete${entity}By${field.propertyName}(@Param("${field.propertyName}") ${field.propertyType} ${field.propertyName}) { return ${table.entityPath}Mapper.delete${entity}By${field.propertyName}(${field.propertyName});}
</#if>
</#list>

<#list table.fields as field>
<#if field.keyFlag>
	/**
	*  根据主键${field.propertyName}更新表${table.name}信息
	*  @param ${table.entityPath}
	*/
	@Override
	public Integer update${entity}By${field.propertyName}(${entity} ${table.entityPath}) { return ${table.entityPath}Mapper.update${entity}By${field.propertyName}(${table.entityPath});}
</#if>
</#list>

<#list table.fields as field>
<#if field.keyFlag>
	/**
	*  新增表${table.name}信息
	*  @param ${table.entityPath}
	*/
	@Override
	public Integer add${entity}(${entity} ${table.entityPath}) { return ${table.entityPath}Mapper.add${entity}(${table.entityPath});}
</#if>
</#list>

}
