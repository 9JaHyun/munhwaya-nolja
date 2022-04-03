package com.munhwa.prj.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.stereotype.Controller;

@Controller
public class SessionController {

    @Autowired
    private SessionRegistry sessionRegistry;

    public String sessions() {
        return "session/sessionList";
    }

    public String expireSession(String sessionId) {
        return "redirect:session/sessions";
    }

    public String sessionExpired() {
        return "session/sessionExpired";
    }

}
