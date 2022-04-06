package com.munhwa.prj.common.entity;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class UploadFileVO {

    private int id;
    private String oname;
    private String sname;
    private String fileGroupId;
    private String extension;
}
