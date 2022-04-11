package com.munhwa.prj.config.auth;

import com.munhwa.prj.config.auth.service.CustomOauth2UserService;
import com.munhwa.prj.config.auth.service.LoginService;
import com.munhwa.prj.config.auth.handler.LoginFailureHandler;
import com.munhwa.prj.config.auth.handler.LoginSuccessHandler;
import com.munhwa.prj.config.auth.handler.OAuth2LoginSuccessHandler;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.SessionManagementConfigurer.SessionFixationConfigurer;
import org.springframework.security.config.oauth2.client.CommonOAuth2Provider;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.InMemoryOAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.client.web.AuthenticatedPrincipalOAuth2AuthorizedClientRepository;
import org.springframework.security.oauth2.client.web.OAuth2AuthorizedClientRepository;

@RequiredArgsConstructor
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final BasicDataSource dataSource;
    private final LoginService loginService;
    private final CustomOauth2UserService customOauth2UserService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
              .headers().frameOptions().disable()
              .and()
              .authorizeRequests(request -> request
                    .antMatchers("/", "/home.do", "/signup.do", "/resources/**", "/css/**",
                          "/js/**", "/*signup*", "/idChk", "/nickChk", "/findId", "/findPassword", "/findIdResult").permitAll()
                    .antMatchers("/member/**").access("hasRole('ROLE_R01')") // member
                    .antMatchers("/artist/**").access("hasRole('ROLE_R02')") // artist
                    .antMatchers("/admin/**").access("hasRole('ROLE_R03')")  // admin
                    .anyRequest().authenticated()
              )
              .formLogin(login -> login
                    .loginPage("/signin").permitAll()
                    .defaultSuccessUrl("/", false)
                    .successHandler(loginSuccessHandler()))
//                    .failureHandler(loginFailureHandler()))
              .logout(logout -> logout
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/home.do")
                    .invalidateHttpSession(true)
                    .deleteCookies("remember-me", "JSESSION_ID"))
              .exceptionHandling(e -> e
                    .accessDeniedPage("/access-denied"))
              .oauth2Login(oauth -> oauth
                          .userInfoEndpoint()
                            .userService(customOauth2UserService)
                          .and()
                          .successHandler(oAuth2LoginSuccessHandler()))
              .sessionManagement(session -> session
                    .sessionFixation(SessionFixationConfigurer::changeSessionId)
                    .maximumSessions(1) // 다른 곳에서 해당 회원으로 로그인 시 로그아웃
                    .maxSessionsPreventsLogin(false)
                    .expiredUrl("/session-expired"));
    }

    @Bean
    public RoleHierarchy roleHierarchy() {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        roleHierarchy.setHierarchy("ROLE_R03 > ROLE_R02 > ROLE_R01");
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
    public LoginSuccessHandler loginSuccessHandler() {
        return new LoginSuccessHandler();
    }

    @Bean
    public OAuth2LoginSuccessHandler oAuth2LoginSuccessHandler() {
        return new OAuth2LoginSuccessHandler();
    }

    @Bean
    public LoginFailureHandler loginFailureHandler() {
        return new LoginFailureHandler();
    }

    // Session
    @Bean
    public SessionRegistry sessionRegistry() {
        return new SessionRegistryImpl();
    }

    //Oauth Service
    @Bean
    public ClientRegistrationRepository clientRegistrationRepository() {
        return new InMemoryClientRegistrationRepository(List.of(this.googleClientRegistration()
        , this.naverClientRegistration()));
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

    // 미구현
    private ClientRegistration faceBookClientRegistration() {
        return CommonOAuth2Provider.FACEBOOK.getBuilder("faceBook")
              .clientId("1022442908968-5nuhth78ov1dmdn6676c9gq93hdvppeo.apps.googleusercontent.com")
              .clientSecret("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")
              .scope("email", "nickname", "profile_image")
              .build();
    }

    private ClientRegistration naverClientRegistration() {
        return CustomCommonOAuth2Provider.NAVER.getBuilder("naver")
              .clientId("XWHt07mxmHaiEzcYAjjP")
              .clientSecret("iaxJ1Ih_qG")
              .scope("nickname", "email", "profile_image")
              .build();
    }
}
