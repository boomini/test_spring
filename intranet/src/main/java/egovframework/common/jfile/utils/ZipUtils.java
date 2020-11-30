package egovframework.common.jfile.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;

/*한글이 깨져서 아래로 대체*/
import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;

import egovframework.common.jfile.GlovalVariables;
import egovframework.common.jfile.security.service.CipherService;
import egovframework.common.jfile.service.JFile;

public class ZipUtils {

	private static final byte[] buf = new byte[1024];

	public static void createZipJFile(JFile[] targetFiles, OutputStream os) throws Exception {

		ZipArchiveOutputStream zipOs = new ZipArchiveOutputStream(os);
		FileInputStream in = null;
		try {
			for (int i = 0; i < targetFiles.length; i++) {

				// 물리적인 파일이 없을경우 압축파일 목록에서 제외 시키기 위해 사용
				try {
					in = new FileInputStream(new File(targetFiles[i].getPath()));
				} catch (FileNotFoundException e) {
					continue;

				}
				zipOs.putArchiveEntry(new ZipArchiveEntry(targetFiles[i].getOriginalFileName()));
				if ("true".equalsIgnoreCase(targetFiles[i].getUseSecurity())) {
					CipherService service = (CipherService) SpringUtils.getBean(GlovalVariables.CIPHER_SERVICE_BEAN_NAME);
					service.decryptForZipFile(in, zipOs);
				} else {
					int data;
					if(in != null){
						while ((data = in.read(buf)) > 0) {
							zipOs.write(buf, 0, data);
						}
					}
				}
				zipOs.closeArchiveEntry();
				if(in != null) in.close();
			}
		} catch (IOException e) {
			System.out.println("IOException: " + e);
		} finally {
			if(in !=null) in.close();
			if(zipOs !=null) zipOs.close();
			if(os !=null) os.close();
		}
	}
}