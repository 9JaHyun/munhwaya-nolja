package com.munhwa.prj.config.auth.handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Getter @Setter
public class LoginFailureHandler implements AuthenticationFailureHandler {
    
    private String loginidname;
    private String loginpwdname;
    private String errormsgname;
    private String defaultFailureUrl;
 
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, 
    					HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {
    	// security에서 주는 파라미터
        String username = request.getParameter(loginidname);
        String password = request.getParameter(loginpwdname);
        String errormsg = exception.getMessage();	// Security에서 제공하는 익셉션 이름만 전달

        // Handler가 새로 집어넣는 파라미터
        request.setAttribute(loginidname, username);
        request.setAttribute(loginpwdname, password);
        request.setAttribute(errormsgname, errormsg);

        // forward => 서버 자체에 url을 변경.
        // redirect => 서버가 사용자에게 url을 변경하라고 명령.
        request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
    }
}
