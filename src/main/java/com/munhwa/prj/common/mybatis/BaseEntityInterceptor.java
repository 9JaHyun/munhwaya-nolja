package com.munhwa.prj.common.mybatis;

import com.munhwa.prj.common.entity.BaseEntity;
import java.util.Properties;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;

@Slf4j
@Intercepts(@Signature(type = Executor.class, method = "update", args = {MappedStatement.class, Object.class}))
public class BaseEntityInterceptor implements Interceptor {

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        BaseEntity baseEntity = new BaseEntity();
        MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
        SqlCommandType sqlCommandType = mappedStatement.getSqlCommandType();

        if (sqlCommandType.equals(SqlCommandType.INSERT)) {
            baseEntity.initCreateEntity();
        }

        if (sqlCommandType.equals(SqlCommandType.UPDATE)) {
            baseEntity.initUpdateEntity();
        }

        // get parameter , this is the target object that you want to handle
        Object parameter = invocation.getArgs()[1];
        return invocation.proceed();
    }

    @Override
    public Object plugin(Object o) {
        return Plugin.wrap(o, this);
    }

    @Override
    public void setProperties(Properties properties) {

    }
}