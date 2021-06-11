package hustar.bbs.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import egovframework.com.cmm.service.CommonService;
import egovframework.com.cmm.util.EgovProperties;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import hustar.bbs.service.NoticeVO;
import hustar.member.service.MemberVO;
import hustar.util.FileUtil;

@Controller
public class NoticeController {
	
	private static final String NOTICE_UPLOAD_PATH = EgovProperties.getProperty("Globals.fileStorePath") + "notice";
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name ="jsonView")
	MappingJackson2JsonView jsonView;
	
	@RequestMapping("/bbs/notice_list.do")
	public String notice_list(
			Model model,
			NoticeVO searchVO) throws Exception {
		
		System.out.println("searchKeyword = " + searchVO.getSearchKeyword());
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setPageSize(paginationInfo.getPageSize());
		
		int recordCount = commonService.selectListTotCnt(searchVO, null, null, "noticeDAO.selectNoticeListCnt");
		paginationInfo.setTotalRecordCount(recordCount);
		
		List<NoticeVO> noticeVOList = (List<NoticeVO>) commonService.selectList(searchVO, null, null, "noticeDAO.selectNoticeList");
		
		model.addAttribute("noticeVOList", noticeVOList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchVO", searchVO);
		
		return "/bbs/notice_list";
	}
	
	@RequestMapping("/bbs/notice_view.do")
	public String notice_view(
			Model model,
			NoticeVO searchVO) throws Exception {
		
		NoticeVO noticeVO = (NoticeVO) commonService.selectView(searchVO, null, null, "noticeDAO.selectNoticeView");
		
		model.addAttribute("noticeVO", noticeVO);
		
		return "/bbs/notice_view";
	}
	
	@RequestMapping("/bbs/notice_write.do")
	public String notice_write(Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		
		return "/bbs/notice_write";
	}
	
	@RequestMapping("/bbs/notice_write_action.do")
	public String notice_write_action(
			NoticeVO noticeVO,
			HttpSession session,
			String mode,
			RedirectAttributes redirectAttributes,
			MultipartFile uploadFile) throws Exception {
		
		System.out.println("subject = " + noticeVO.getSubject());
		System.out.println("contents = " + noticeVO.getContents());
		
		MemberVO loginVO = (MemberVO) session.getAttribute("login");
		
		if (loginVO == null) {
			redirectAttributes.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/member/login.do";
		}
		
		noticeVO.setWriter(loginVO.getName());
		
		// ex) 13f5ec97-c848-4a15-9b95-48678bab468e_dog.jpg
		String filename = FileUtil.saveFile(uploadFile, NOTICE_UPLOAD_PATH);
		if (filename != null) {
			noticeVO.setFilename(filename);
			
			// arr[] = filename.split("_")
			// arr[0] = "13f5ec97-c848-4a15-9b95-48678bab468e"
			// arr[1] = "dog.jpg"
			String oriFilename = filename.split("_")[1];
			noticeVO.setOriFilename(oriFilename);
		}
		
		// mode: write, modify
		if("write".equals(mode)) {
			commonService.insert(noticeVO, null, null, "noticeDAO.insertNotice");
		} else {
			commonService.update(noticeVO, null, null, "noticeDAO.updateNotice");
		}
		
		return "redirect:/bbs/notice_list.do";
	}
	
	@RequestMapping("/bbs/notice_modify.do")
	public String notice_modify(
			Model model,
			NoticeVO searchVO) throws Exception {
		
		NoticeVO noticeVO = (NoticeVO) commonService.selectView(searchVO, null, null, "noticeDAO.selectNoticeView");
		
		model.addAttribute("noticeVO", noticeVO);
		model.addAttribute("mode", "modify");
		
		return "/bbs/notice_write";
	}
	
	@RequestMapping("/bbs/notice_delete.do")
	public String notice_delete(NoticeVO noticeVO) throws Exception {
		
		System.out.println("seq = " + noticeVO.getSeq());
		
		commonService.delete(noticeVO, null, null, "noticeDAO.deleteNotice");
		
		return "redirect:/bbs/notice_list.do";
	}
	
	@RequestMapping("/bbs/notice_downloadFile.do")
	public void notice_downloadFile(
			NoticeVO searchVO,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		NoticeVO noticeVO = (NoticeVO) commonService.selectView(searchVO, null, null, "noticeDAO.selectNoticeView");
		
		String filename = noticeVO.getFilename();
		if (filename == null) {
			return;
		}
		
		String filePath = NOTICE_UPLOAD_PATH + "/" + noticeVO.getFilename();
		
		FileUtil.downFile(request, response, filePath, noticeVO.getOriFilename());
	}
	
	@RequestMapping("/bbs/notice_deleteFile.do")
	public ModelAndView notice_deleteFile(
			NoticeVO searchVO,
			Model model) throws Exception {
		
		NoticeVO fileVO = (NoticeVO) commonService.selectView(searchVO, null, null, "noticeDAO.selectNoticeView");
		
		String filePath = NOTICE_UPLOAD_PATH + "/" + fileVO.getFilename();
		
		if (FileUtil.deleteFile(filePath) == true) {
			NoticeVO noticeVO = new NoticeVO();
			noticeVO.setSeq(searchVO.getSeq());
			noticeVO.setFilename("");
			noticeVO.setOriFilename("");
			commonService.update(noticeVO, null, null, "noticeDAO.updateNotice");
			
			model.addAttribute("success", "true");
		} else {
			model.addAttribute("success", "false");
		}
		
		return new ModelAndView(jsonView);
	}
}
