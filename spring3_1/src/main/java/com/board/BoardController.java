package com.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.util.HashMapBinder;

public class BoardController extends MultiActionController{
	Logger logger = Logger.getLogger(BoardController.class);
	//@Autowired
	private BoardLogic boardLogic = null;
	public void setBoardLogic(BoardLogic boardLogic) {
		this.boardLogic = boardLogic;
	}
	//전체 조회 나 조건 검색 구현
	public ModelAndView boardList(HttpServletRequest req, HttpServletResponse res){
		logger.info("boardList 호출 성공");
		List<Map<String,Object>> boardList = null;
		Map<String,Object> pmap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pmap);		
		boardList = boardLogic.boardList(pmap);
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", boardList);
		mav.setViewName("board/boardList");
		return mav;
	}
	//상세보기 페이지 구현 - 1건 가져옴 - WEB-INF/views/board/ -  read.jsp
	public ModelAndView boardDetail(HttpServletRequest req, HttpServletResponse res){
		logger.info("boardDetail 호출 성공");
		List<Map<String,Object>> boardList = null;
		Map<String,Object> pmap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pmap);
		boardList = boardLogic.boardList(pmap);
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardDetail", boardList);
		mav.setViewName("board/read");
		return mav;
	}
	//글수정 입력 화면  구현 - 1건 가져옴 webapp/board/  - repleForm.jsp
	public String repleForm(HttpServletRequest req, HttpServletResponse res){
		logger.info("repleForm 호출 성공");
		List<Map<String,Object>> boardList = null;
		Map<String,Object> pmap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pmap);
		boardList = boardLogic.boardList(pmap);
		logger.info("repleForm:"+boardList);
		req.setAttribute("repleForm", boardList);
		return "forward:/board/repleForm.jsp";
	}
	public void boardDelete(HttpServletRequest req, HttpServletResponse res)
	throws Exception
	{
		logger.info("Con boardDelete 호출 성공");
		int result = 0;
	    Map<String,Object> pmap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pmap);
		result = boardLogic.boardDelete(pmap);
		if(result == 1) {//등록 성공한거니?
			res.sendRedirect("/board/boardInsertOk.jsp");
		}else {
			res.sendRedirect("/board/boardInsertFail.sp");			
		}
	}
	public void boardInsert(HttpServletRequest req, HttpServletResponse res)
			throws Exception
	{
		logger.info("boardInsert 호출 성공");
		int result = 0;
		Map<String,Object> pmap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.multiBind(pmap);
		String savePath = "C:\\workspace_sts3\\spring3_1\\src\\main\\webapp\\pds";
		String fullPath = null;
		String filename = null;
		//filename = bs_file.getOriginalFilename();
		logger.info(filename);
		fullPath = savePath+"\\"+filename;
		logger.info("fullPath:"+fullPath);
		//result = boardLogic.boardInsert(pmap);
		if(result == 1) {//등록 성공한거니?
			res.sendRedirect("/board/boardInsertOk.jsp");
		}else {
			res.sendRedirect("/board/boardInsertFail.sp");			
		}
	}
	public void writeForm(HttpServletRequest req, HttpServletResponse res)
			throws Exception
	{
		logger.info("writeForm 호출 성공");
		res.sendRedirect("writeForm.jsp");
	}
	public ModelAndView writeForm2(HttpServletRequest req, HttpServletResponse res)
			throws Exception
	{
		logger.info("writeForm2 호출 성공");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/writeForm");
		return mav;
	}
}
