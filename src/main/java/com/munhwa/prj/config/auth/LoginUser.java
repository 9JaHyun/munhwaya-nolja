package com.munhwa.prj.config.auth;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.PARAMETER)          // 생성될 위치
@Retention(RetentionPolicy.RUNTIME)
public @interface LoginUser {
}

