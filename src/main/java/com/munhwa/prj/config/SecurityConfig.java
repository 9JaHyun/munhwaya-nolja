package com.munhwa.prj.config;

import com.munhwa.prj.member.service.LoginService;
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
import org.springframework.security.config.oauth2.client.CommonOAuth2Provider;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.InMemoryOAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.client.web.AuthenticatedPrincipalOAuth2AuthorizedClientRepository;
import org.springframework.security.oauth2.client.web.OAuth2AuthorizedClientRepository;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Slf4j
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final BasicDataSource dataSource;
    private final LoginService loginService;

    public SecurityConfig(BasicDataSource dataSource,
          LoginService loginService) {
        this.dataSource = dataSource;
        this.loginService = loginService;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
              .headers().frameOptions().disable()
              .and()
              .authorizeRequests(request -> request
                    .antMatchers("/", "/home.do", "/signup.do", "/resources/**", "/css/**",
                          "/js/**", "/*signup*", "/idChk", "/nickChk").permitAll()
                    .antMatchers("/member/**").access("hasRole('R01')") // member
                    .antMatchers("/artist/**").access("hasRole('R02')") // artist
                    .antMatchers("/admin/**").access("hasRole('R03')")  // admin
                    .anyRequest().authenticated()
              )
              .formLogin(login -> login
                    .loginPage("/signin").permitAll()
                    .defaultSuccessUrl("/", false)
                    .failureUrl("/signin"))
              .logout(logout -> logout
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/home.do")
                    .invalidateHttpSession(true)
                    .deleteCookies("remember-me", "JSESSION_ID"))
              .exceptionHandling(e -> e
                    .accessDeniedPage("/access-denied"))
              .oauth2Login();
    }

    @Bean
    public AuthenticationSuccessHandler loginSuccessHandler() {
        return new CustomLoginSucc
    }

    @Bean
    public RoleHierarchy roleHierarchy() {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        roleHierarchy.setHierarchy("ROLE_R03> ROLE_RO2 > ROLE_R01");
        return roleHierarchy;
    }
    // Encode
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(loginService);
        passwordEncoder();
    }

    @Bean
    public ClientRegistrationRepository clientRegistrationRepository() {
        return new InMemoryClientRegistrationRepository(this.googleClientRegistration());
    }

    @Bean
    public OAuth2AuthorizedClientService authorizedClientService(
          ClientRegistrationRepository clientRegistrationRepository) {
        return new InMemoryOAuth2AuthorizedClientService(clientRegistrationRepository);
    }

    @Bean
    public OAuth2AuthorizedClientRepository authorizedClientRepository(
          OAuth2AuthorizedClientService authorizedClientService) {
        return new AuthenticatedPrincipalOAuth2AuthorizedClientRepository(authorizedClientService);
    }

    private ClientRegistration googleClientRegistration() {
        return CommonOAuth2Provider.GOOGLE.getBuilder("google")
              .clientId("1022442908968-5nuhth78ov1dmdn6676c9gq93hdvppeo.apps.googleusercontent.com")
              .clientSecret("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")
              .scope("profile", "email")
              .build();
    }
}
