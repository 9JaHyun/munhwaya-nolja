package com.munhwa.prj.member.serviceImpl;

import com.munhwa.prj.common.service.PropertiesScan;
import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service("memberDao")
public class MemberServiceImpl implements MemberService {

    private final PasswordEncoder passwordEncoder;

    private final MemberMapper map;

    private String email;
    private String password;

    public MemberServiceImpl(MemberMapper map, PasswordEncoder passwordEncoder) {
        this.map = map;
        this.passwordEncoder = passwordEncoder;
        PropertiesScan scan = new PropertiesScan();
        Properties smsInfo = scan.readProperties("config/email.properties");
        email = smsInfo.getProperty("email");
        password = smsInfo.getProperty("password");
    }

    @Override
    public int memberSignup(MemberVO vo) {
        return map.memberSignup(vo);
    }

    @Override
    public int idChk(String id) {
        return map.idChk(id);
    }

    @Override
    public int nickChk(String nickname) {
        return map.nickChk(nickname);
    }

    @Override
    public int updateInfo(MemberVO vo) {
        return map.updateInfo(vo);
    }

    @Override
    public int updatePassword(MemberVO vo) {
        return map.updatePassword(vo);
    }

    @Override
    public int deleteMember(MemberVO vo) {
        return map.deleteMember(vo);
    }

    public MemberVO findById(String id) {
        return map.selectByMemberId(id);
    }

    // 마일리지 충전 22/04/04 류기태
    @Override
    public int plusMileage(MemberVO vo) {
        return map.plusMileage(vo);
    }

    // 마일리지 사용 22/04/04 류기태
    @Override
    public int minusMileage(List<MemberVO> vo) {
        int cnt = 0;
        for (MemberVO memberVO : vo) {
            map.minusMileage(memberVO);
        }
        return cnt;
    }

    @Override
    public int updateProfile(MemberVO vo) {
        return map.updateProfile(vo);
    }

    @Override
    public List<MemberVO> findIdList(MemberVO vo) {
        return map.findIdList(vo);
    }

    @Override
    public void sendEmail(MemberVO vo, String pw, String div) throws Exception {
        // Mail Server 설정
        String charSet = "utf-8";
        String hostSMTP = "smtp.gmail.com"; // 네이버 이용시 smtp.naver.com
        String hostSMTPid = email; // 보내는 사람 이메일 주소
        String hostSMTPpwd = password; // 보내는 사람 비밀번호

        // 보내는 사람 EMail, 제목, 내용
        String fromEmail = email;
        String fromName = "문화야놀자";
        String subject = "";
        String msg = "";

        if (div.equals("findpw")) {
            subject = "임시 비밀번호 입니다.";
            msg += "<div align='center' style='border:1px solid black; font-family:verdana; padding: 200px 100px 200px 100px;'>";
            msg += "<h3 style='color: blue;'>";
            msg += vo.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
            msg += "<p>임시 비밀번호 : ";
            msg += pw + "</p></div>";
        }

        // 받는 사람 E-Mail 주소
        String mail = vo.getId();
        try {
            HtmlEmail email = new HtmlEmail();
            email.setDebug(true);
            email.setCharset(charSet);
            email.setSSL(true);
            email.setHostName(hostSMTP);
            email.setSmtpPort(465); // 네이버 이용시 587

            email.setAuthentication(hostSMTPid, hostSMTPpwd);
            email.setTLS(true);
            email.addTo(mail, charSet);
            email.setFrom(fromEmail, fromName, charSet);
            email.setSubject(subject);
            email.setHtmlMsg(msg);
            email.send();
        } catch (Exception e) {
            System.out.println("메일발송 실패 : " + e);
        }
    }

    // 비밀번호찾기
    @Override
    public boolean findPw(MemberVO vo) throws Exception {
        MemberVO ck = map.selectByMemberId(vo.getId());

        if (ck == null) {
            return false;
        }
        // 임시 비밀번호 생성
        String pw = "";
        for (int i = 0; i < 12; i++) {
            pw += (char) ((Math.random() * 26) + 97);
        }
        vo.setPassword(passwordEncoder.encode(pw));
        // 비밀번호 변경
        map.updatePassword2(vo);
        // 비밀번호 변경 메일 발송
        sendEmail(vo, pw, "findpw");
        return true;

    }

    // 프로시저 곡 구매 마일리지 22/04/08 류기태
    @Override
    public int updateMileageMusic(Map<String, Object> vo) {
        return map.updateMileageMusic(vo);
    }

    // 프로시저 공연 구매 마일리지 22/04/08 류기태
    @Override
    public int updateMileagePerformance(Map<String, Object> vo) {
        return map.updateMileagePerformance(vo);
    }
}