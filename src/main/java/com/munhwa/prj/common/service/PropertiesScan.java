package com.munhwa.prj.common.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.stereotype.Component;

@Component
public class PropertiesScan {
    public Properties readProperties(String propFileName) {
        Properties prop = new Properties();
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

        try {
            if (inputStream != null) {
                prop.load(inputStream);
                return prop;
            } else {
                throw new FileNotFoundException(
                      "프로퍼티 파일 '" + propFileName + "'을 resource에서 찾을 수 없습니다.");
            }
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
