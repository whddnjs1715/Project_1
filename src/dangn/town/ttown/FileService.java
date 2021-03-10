package dangn.town.ttown;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import dangn.town.ttown.TtownDAO;
import dangn.town.ttown.TtownDTO;

public class FileService {
	private TtownDAO ttownDAO = null;
	public static String SAVE_PATH = "/Users/whddnjs1715/JSP/XXProject/WebContent/upload";
	
	public FileService() {
		ttownDAO = new TtownDAO();
	}
	
	public boolean fileUpload(String name, String select1,String select2, String address1,String address2, String hp, String web, String content, File file) {
		TtownDTO ttownDTO = new TtownDTO();
		ttownDTO.setName(name);
		ttownDTO.setSelect1(select1);
		ttownDTO.setSelect2(select2);
		ttownDTO.setAddress(address1);
		ttownDTO.setDetailAddress(address2);
		ttownDTO.setHp(hp);
		ttownDTO.setWeb(web);
		ttownDTO.setContent(content);
		ttownDTO.setPic1(file.getName());	// 원본 파일명
		ttownDTO.setPic2(file.getName());
		ttownDTO.setPic3(file.getName());
		ttownDTO = ttownDAO.insertFile(ttownDTO);
		System.out.println("최종 파일 정보 : " + ttownDTO);
		return true;
	}
}
