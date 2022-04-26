package com.munhwa.prj.common.file.api;

import com.munhwa.prj.common.file.entity.UploadFileVO;
import com.munhwa.prj.common.file.service.FileUtils;
import com.munhwa.prj.common.file.service.UploadFileService;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    // 경로 넘기기
    @ResponseBody
    @GetMapping("/api/file/{filename:.+}")
    public Resource sendFullPath(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileUtils.getFullPath(filename));
    }

    // 경로 넘기기
    @ResponseBody
    @GetMapping("/api/music/{filename:.+}")
    public Resource sendMusicPath(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileUtils.getFullPath(filename));
    }


    // 로컬의 사진 파일을 웹에 렌더링 할 때 사용
    @ResponseBody
    @GetMapping("/api/picture/qrCodes/{filename:.+}")
    public Resource getQR(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileUtils.getFullPath("qrCodes/" + filename));
    }

    // 로컬의 첨부 파일을 다운로드 할 때 사용
    @GetMapping("/api/attach/{itemId}")
    public ResponseEntity<Resource> downloadAttach(@PathVariable int itemId)
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
