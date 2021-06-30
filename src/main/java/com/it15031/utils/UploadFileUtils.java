package com.it15031.utils;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadFileUtils {
	public File handleUploadFile(MultipartFile uploadfile ) {
		String folderPath="D:\\Java5\\practice\\Assignment_Java5\\src\\main\\webapp\\storage";
		File myUpload= new File(folderPath);
		
		//kiểm tra thư mục lưu trữ file có tồn tại hay không
		if(!myUpload.exists()) {
			myUpload.mkdirs();
		}
		
		//lưu file vào  thư mục đã chọn
		File savefile=null;
		try {
			
			String uui=UUID.randomUUID().toString();
			String filename=uui + "_" + uploadfile.getOriginalFilename();
		 savefile= new File(myUpload, filename);
			uploadfile.transferTo(savefile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return savefile;
	}
}
