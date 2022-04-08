package com.munhwa.prj.config.auth;

import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.member.mapper.MemberMapper;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

@RequiredArgsConstructor
@Component
public class LoginUserArgumentResolver implements HandlerMethodArgumentResolver {
    private final HttpSession httpSession;
    private final MemberMapper memberMapper;

    // 컨트롤러 메서드의 특정 파라미터를 지원하는가?
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        boolean isLoginUserAnnotation = parameter.getParameterAnnotation(LoginUser.class) != null;  // @LoginUser가 붙어 있어야 하고
        boolean isUserClass = SessionUser.class.equals(parameter.getParameterType());               // 파라미터 클래스가 SessionUser.class 인가?
        return isLoginUserAnnotation && isUserClass;
    }

    // 파라미터에 전달할 객체 생성
    // 여기서는 세션에서 객체를 가져옴.
    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        return httpSession.getAttribute("member");
    }
}
