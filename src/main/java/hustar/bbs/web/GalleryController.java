package hustar.bbs.web;


import java.util.List;

import javax.annotation.Resource;
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
import hustar.bbs.service.GalleryVO;
import hustar.member.service.MemberVO;
import hustar.util.FileUtil;

@Controller
public class GalleryController {
	
	private static final String GALLERY_UPLOAD_PATH = EgovProperties.getProperty("Globals.fileStorePath") + "gallery";
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name ="jsonView")
	MappingJackson2JsonView jsonView;
	
	@RequestMapping("/bbs/gallery_list.do")
	public String gallery_list(GalleryVO searchVO, Model model) throws Exception {
		
		List<GalleryVO> galleryVOList = (List<GalleryVO>) commonService.selectList(searchVO, null, null, "galleryDAO.selectGalleryList");
		
		model.addAttribute("galleryVOList", galleryVOList);
		return "/bbs/gallery_list";
	}

	@RequestMapping("/bbs/gallery_view.do")
	public String gallery_view(GalleryVO searchVO, Model model) throws Exception {
		
		GalleryVO galleryVO = (GalleryVO) commonService.selectView(searchVO, null, null, "galleryDAO.selectGalleryView");
		
		model.addAttribute("galleryVO", galleryVO);
		return "/bbs/gallery_view";
	}
	
	@RequestMapping("/bbs/gallery_writeView.do")
	public String gallery_writeView(GalleryVO searchVO, Model model) throws Exception {
		
		return "/bbs/gallery_write";
	}
	
	
	@RequestMapping("/bbs/gallery_write.do")
	public String gallery_write(GalleryVO searchVO, Model model) throws Exception {
		
		model.addAttribute("mode","write");
		
		commonService.insert(searchVO, null, null,"galleryDAO.insertGallery");
		return "/bbs/gallery_write";
	}
	
	
	@RequestMapping("/bbs/gallery_modify.do")
	public String gallery_modify(Model model, GalleryVO searchVO) throws Exception {
		
		GalleryVO galleryVO = (GalleryVO) commonService.selectView(searchVO, null, null, "galleryDAO.selectGalleryView");
		
		model.addAttribute("mode","modify");
		model.addAttribute("galleryVO",galleryVO);
		
		return "/bbs/gallery_write";
	}
	
	@RequestMapping("/bbs/gallery_write_action.do") 
	public String gallery_write_action(
			GalleryVO galleryVO, 
			HttpSession session, 
			RedirectAttributes redirectAttributes,
			MultipartFile uploadFile,
			String mode) throws Exception {
		
		MemberVO loginVO = (MemberVO) session.getAttribute("login");
		
		if(loginVO == null) {
			redirectAttributes.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/member/login.do";
		}
		
		galleryVO.setWriter(loginVO.getName());
		
		// ex) s213sa-sasa_dog.jpg
		String filename = FileUtil.saveFile(uploadFile, GALLERY_UPLOAD_PATH);
		if(filename != null) {
			galleryVO.setFilename(filename);
			
			//arr[] = "filename.split("-");
			//arr[0] = "s213sa-sasa"
			// arr[1] = "dog.jpg"
		String oriFilename = filename.split("_")[1];
		galleryVO.setOriFilename(oriFilename);
		
		}

		if("modify".equals(mode)) {
			commonService.update(galleryVO, null, null,"galleryDAO.updateGallery");
		} else {
			commonService.update(galleryVO, null, null,"galleryDAO.insertGallery");
		}
		
		return "redirect:/bbs/gallery_list.do";
	}
	
	@RequestMapping("/bbs/gallery_image.do")
	public void gallery_image(
			GalleryVO searchVO, 
			HttpServletResponse response) throws Exception{
		
		GalleryVO galleryVO = (GalleryVO) commonService.selectView(searchVO, null, null, "galleryDAO.selectGalleryView");
		
		FileUtil.displayImage(response, GALLERY_UPLOAD_PATH, galleryVO.getFilename());
	}
	
	
	@RequestMapping("/bbs/gallery_deledteFile.do")
	public ModelAndView gallery_deleteFile(GalleryVO searchVO, Model model) throws Exception {
		
		GalleryVO fileVO = (GalleryVO) commonService.selectView(searchVO, null, null,"galleryDAO.selectGalleryView");
		String filePath = GALLERY_UPLOAD_PATH + "/" + fileVO.getFilename();
		FileUtil.deleteFile(filePath);
		
		GalleryVO galleryVO = new GalleryVO();
		galleryVO.setSeq(searchVO.getSeq());
		galleryVO.setFilename("");
		galleryVO.setOriFilename("");

		commonService.update(galleryVO, null, null, "galleryDAO.updateGallery");

		model.addAttribute("success","true");
		
		return new ModelAndView(jsonView);
	}
	
	@RequestMapping("/bbs/gallery_delete.do")
	public String gallery_delete(GalleryVO searchVO) throws Exception {
		GalleryVO fileVO = (GalleryVO) commonService.selectView(searchVO, null, null,"galleryDAO.selectGalleryView");
		String filePath = GALLERY_UPLOAD_PATH + "/" + fileVO.getFilename();
		FileUtil.deleteFile(filePath);
		
		commonService.delete(searchVO, null, null,"galleryDAO.deleteGallery");
		return "redirect:/bbs/gallery_list.do";
	}
}
