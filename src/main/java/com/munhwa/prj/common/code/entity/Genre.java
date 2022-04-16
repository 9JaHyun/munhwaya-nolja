package com.munhwa.prj.common.code.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Genre {
    G01("G01", "발라드"),
    G02("G02", "댄스"),
    G03("G03", "랩/힙합"),
    G04("G04", "R&B/SOUL");

    private final String key;
    private final String role;
}
