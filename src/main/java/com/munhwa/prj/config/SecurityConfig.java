package com.munhwa.prj.config;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Slf4j
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

    private final BasicDataSource dataSource;

    public SecurityConfig(BasicDataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
              .headers().frameOptions().disable()
              .and()
              .authorizeRequests(request -> request
                    .antMatchers("/", "/home.do", "/resources/**", "/css/**", "/js/**", "/signupForm.do", "memberSignup.do").permitAll()
                    .antMatchers("/artist/**").access("hasRole('R02')")
                    .anyRequest().authenticated()
              )
              .formLogin(login -> login
                    .loginPage("/signIn").permitAll()
                    .defaultSuccessUrl("/", false)
                    .failureUrl("/signIn"))
              .logout(logout -> logout
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/home.do")
                    .invalidateHttpSession(true)
                    .deleteCookies("remember-me", "JSESSION_ID"))
              .exceptionHandling(e -> e
                    .accessDeniedPage("/access-denied"));
    }

    @Bean
    public RoleHierarchy roleHierarchy() {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        roleHierarchy.setHierarchy("ROLE_RO2 > ROLE_R01");
        return roleHierarchy;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        log.info("configure JDBC!!");
        String queryUser = "select id, password from member where id = ?";
        String queryDetails = "select id, role from member where id = ?";
        auth.jdbcAuthentication()
              .dataSource(dataSource)
              .passwordEncoder(passwordEncoder())
              .usersByUsernameQuery(queryUser)
              .authoritiesByUsernameQuery(queryDetails);
    }
}
