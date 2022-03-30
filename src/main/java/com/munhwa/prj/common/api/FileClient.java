package com.munhwa.prj.common.api;

import com.munhwa.prj.common.entity.UploadFileVO;
import com.munhwa.prj.common.service.FileUtils;
import com.munhwa.prj.common.service.UploadFileService;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FileClient {

    private final FileUtils fileUtils;
    private final UploadFileService uploadFileService;

    public FileClient(FileUtils fileUtils,
          UploadFileService uploadFileService) {
        this.fileUtils = fileUtils;
        this.uploadFileService = uploadFileService;
    }


    // 로컬의 사진 파일을 웹에 렌더링 할 때 사용
    @ResponseBody
    @GetMapping("/api/picture/{filename:.+}")
    public Resource getPictureSource(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileUtils.getFullPath(filename));
    }

    // 로컬의 첨부 파일을 다운로드 할 때 사용
    @PostMapping("/api/attach")
    public ResponseEntity<Resource> downloadAttach(@RequestBody int itemId)
          throws MalformedURLException, UnsupportedEncodingException {
        UploadFileVO file = uploadFileService.findById(itemId);
        String originalFileName = file.getOname();
        String storeFileName = file.getSname();

        UrlResource resource = new UrlResource("file:" + fileUtils.getFullPath(storeFileName));
        String encodedUploadFileName = URLEncoder.encode(originalFileName,
              java.nio.charset.StandardCharsets.UTF_8.toString());

        String contentDisposition = "attachment; filename=\"" +encodedUploadFileName + "\"";
        return ResponseEntity.ok()
              .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
              .body(resource);
    }
}