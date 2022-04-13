package com.munhwa.prj.member.vo;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Auth {
    R01("R01", "일반 사용자"),
    R02("R02", "아티스트"),
    R11("R11", "비밀번호 변경");

    private final String key;
    private final String role;
}
