package com.munhwa.prj.common.file.service;

import com.munhwa.prj.common.file.entity.UploadFile;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtils {

    private String fileDir = "C:\\Users\\rnwkg\\dev\\fileTest\\";
//    private String fileDir = "/home/ubuntu/dev/";

    // 단일 파일 저장
    public UploadFile storeFile(MultipartFile multipartFile) throws IOException {
        if (multipartFile.isEmpty()) {
            return null;
        }

        String originalFileName = multipartFile.getOriginalFilename();
        String storedFileName = createStoredFileName(originalFileName);
        multipartFile.transferTo(new File(getFullPath(storedFileName)));
      
        return new UploadFile(originalFileName, storedFileName);
    }

    // 여러 파일 저장
    public List<UploadFile> storeFiles(List<MultipartFile> multipartFiles) throws IOException {
        ArrayList<UploadFile> uploadList = new ArrayList<>();
        for (MultipartFile multipartFile : multipartFiles) {
            if (!multipartFile.isEmpty()) {
                uploadList.add(storeFile(multipartFile));
            }
        }
        return uploadList;
    }

    // 로컬 파일 삭제
    public boolean deleteFile(String fileName) {
        File file = new File(getFullPath(fileName));
        if (file.exists()) {
            return file.delete();
        }
        return false;
    }

    public String getFullPath(String fileName) {
        return fileDir + fileName;
    }

    public String getMusicFullPath(String fileName) {
        return fileDir + "/music/" + fileName;
    }

    private String createStoredFileName(String fileName) {
        String extract = extract(fileName);
        String uuid = UUID.randomUUID().toString();
        return uuid + "." + extract;
    }

    // 확장자 추출
    private String extract(String originalFileName) {
        int pos = originalFileName.lastIndexOf(".");
        return originalFileName.substring(pos + 1);
    }
}
