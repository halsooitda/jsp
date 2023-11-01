package handler;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileHandler {	
	private static final Logger log =
			LoggerFactory.getLogger(FileHandler.class);
	
	//파일 이름과 경로를 받아서 파일을 삭제하는 메서드
	//리턴타입 int(isOk) => 잘 삭제했는지 체크하기 위한 변수
	public int deleteFile(String imageFileName, String savePath) {
		boolean isDel = true; //삭제가 잘 이루어졌는지 체크하는 변수
		log.info("imageFileName >> "+imageFileName);
		
		File fileDir = new File(savePath);
		File removeFile = new File(fileDir+File.separator+imageFileName);
		File removeThFile = new File(fileDir+File.separator+"_th_"+imageFileName);
		
		//현재 시점에서 삭제하고자 하는 파일이 존재해야 삭제
		if(removeFile.exists() || removeThFile.exists()) {
			isDel = removeFile.delete(); //boolean 형태로 리턴
			log.info(">>>>> del : "+(isDel? "성공" : "실패"));
			if(isDel) { //삭제되면 true
				isDel = removeThFile.delete();
				log.info(">>>>> ThFile del : "+(isDel? "성공" : "실패"));				
			}
		}
		log.info("remove file ok");
		
		return isDel? 1 : 0; //isDel true면 1 false면 0
	}

}
