package ${package.Mapper};

import ${package.Entity}.${entity};
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ${table.mapperName}{
	
	 /**
	  *  查询表${table.name}所有信息
	  */
	 List<${entity}> findAll${entity}();
	  
	<#list table.fields as field>
	<#if field.keyFlag>
	 /**
	  *  根据主键${field.propertyName}查询表${table.name}信息
	  *  @param ${field.propertyName}
	  */
	 ${entity} find${entity}By${field.propertyName}(@Param("${field.propertyName}") ${field.propertyType} ${field.propertyName});
	</#if>
	</#list>

	/**
	*  根据条件查询表${table.name}信息
	*  @param ${table.entityPath}
	*/
	List<${entity}> find${entity}ByCondition(${entity} ${table.entityPath});

	<#list table.fields as field>
	<#if field.keyFlag>
	 /**
	  *  根据主键${field.propertyName}查询表${table.name}信息
	  *  @param ${field.propertyName}
	  */
	 Integer delete${entity}By${field.propertyName}(@Param("${field.propertyName}") ${field.propertyType} ${field.propertyName});
	</#if>
	</#list>
	
	<#list table.fields as field>
	<#if field.keyFlag>
	 /**
	  *  根据主键${field.propertyName}更新表${table.name}信息
	  *  @param ${table.entityPath}
	  */
	 Integer update${entity}By${field.propertyName}(${entity} ${table.entityPath});
	</#if>
	</#list>
	
	<#list table.fields as field>
	<#if field.keyFlag>
	 /**
	  *  新增表${table.name}信息
	  *  @param ${table.entityPath}
	  */
	 Integer add${entity}(${entity} ${table.entityPath});
	</#if>
	</#list>
	
}

