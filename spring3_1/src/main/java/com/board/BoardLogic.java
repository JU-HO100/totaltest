package com.board;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/*
 * AOP 프레임워크를 활용하여 트랜잭션 처리하는 구간임.
 */
public class BoardLogic {
   Logger logger = Logger.getLogger(BoardLogic.class);
   private SqlBoardMDao sqlBoardMDao = null;
   //SqlBoardMDao에 대한 setter객체 주입 코드
   public void setSqlBoardMDao(SqlBoardMDao sqlBoardMDao) {
      this.sqlBoardMDao = sqlBoardMDao;
   }
   private SqlBoardDDao sqlBoardDDao = null;
   //SqlBoardDDao에 대한 setter객체 주입 코드
   public void setSqlBoardDDao(SqlBoardDDao sqlBoardDDao) {
      this.sqlBoardDDao = sqlBoardDDao;
   }
   public int boardInsert(Map<String, Object> pMap) {
      logger.info("boardInsert 호출 성공"+pMap);
      int result = 0;
      int bm_no = 0;
      int bm_group = 0;
      if(pMap.get("bm_group")!=null) {
         bm_group = Integer.parseInt(pMap.get("bm_group").toString());
      }
      //글번호 채번한 결과를 파라미터에 저장
      bm_no = sqlBoardMDao.getBmno();
      pMap.put("bm_no",bm_no);
      //너 댓글이니?
      if(bm_group > 0) {
         pMap.put("bm_group",bm_group);
         sqlBoardMDao.bmStepUpdate(pMap);
         int pos = 0;
         int step = 0;
         if(pMap.get("bm_pos") !=null) {
            pos = Integer.parseInt(pMap.get("bm_pos").toString());
         }
         pMap.put("bm_pos", pos+1);
         if(pMap.get("bm_step") !=null) {
            step = Integer.parseInt(pMap.get("bm_step").toString());
         }
         pMap.put("bm_step", step+1);
      }
      //너 새글이야?
      else { 
         bm_group = sqlBoardMDao.getBmGroup();
         pMap.put("bm_group", bm_group);
         pMap.put("bm_pos", 0);
         pMap.put("bm_step", 0);
      }
      int mresult = sqlBoardMDao.boardMInsert(pMap);
      //첨부파일이 있니?
      if(pMap.get("bs_file")!=null && pMap.get("bs_file").toString().length() > 1) {
         pMap.put("bm_no",bm_no);
         pMap.put("bm_seq",1);
         int dresult = sqlBoardDDao.boardDInsert(pMap);
      }
      return mresult;
   }
   public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
      logger.info("boardList 호출 성공"+pMap);
      List<Map<String, Object>> bList = null;
      bList = sqlBoardMDao.boardList(pMap);
      return bList;
   }
public int boardDelete(Map<String, Object> pmap) {
	try {
		String filePath = "D:\\workspace_sts3\\spring3_1\\src\\main\\webapp\\pds\\";
		String filename = pmap.get("bs_file").toString();
		String fullPath = filePath+filename;
		//실제 존재하는 파일 이름을 객체로 생성하기
		File file = new File(fullPath);
		if(file !=null) {
			if(file.exists()) {
				boolean isOk = file.delete();
				logger.info(isOk);
				pmap.put("bs_file",1);
				sqlBoardDDao.baordDDelete(pmap);
			}
		}
		sqlBoardMDao.boardMDelete(pmap);
	} catch (Exception e) {
		logger.info("Exception:"+e.toString());
	}
	return 0;
}

}













