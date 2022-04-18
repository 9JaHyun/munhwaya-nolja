package com.munhwa.prj.common.file.entity;

import lombok.Data;

/**
 * 첨부파일을 관리하는 UploadFile 엔티티
 *  originalFileName: 기존의 파일명 (음악 파일, 게시판 첨부 파일 등 다운로드 받았을 때 업로드할때의 이름을 유지할 때 사용)
 *  storedFileName: 서버 로컬에 저장될 파일명 (업로드 파일 이름이 같은 상황이 발생하기 때문에 확장자를 제외하고 UUID로 변환 후 저장)
 */
@Data
public class UploadFile {

    private String originalFileName;
    private String storedFileName; 

    public UploadFile(String originalFileName, String storedFileName) {
        this.originalFileName = originalFileName;
        this.storedFileName = storedFileName;
    }
}
