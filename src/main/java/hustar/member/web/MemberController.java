package hustar.member.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import egovframework.com.cmm.service.CommonService;
import hustar.member.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name ="jsonView")
	MappingJackson2JsonView jsonView;
	
	@RequestMapping("/member/login.do")
	public String login(
			HttpServletRequest request,
			Model model) throws Exception {
		
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if (inputFlashMap != null) {
			model.addAttribute("msg", inputFlashMap.get("msg"));
			System.out.println("msg = " + inputFlashMap.get("msg"));
		}
		
		return "/member/login";
	}
	
	@RequestMapping("/member/join.do")
	public String join(
			HttpServletRequest request,
			Model model) throws Exception {
		
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if (inputFlashMap != null) {
			model.addAttribute("msg", inputFlashMap.get("msg"));
			System.out.println("msg = " + inputFlashMap.get("msg"));
		}
		
		return "/member/join";
	}
	
	@RequestMapping("/member/joinInsert.do")
	public String joinInsert(
			@ModelAttribute("memberVO") MemberVO memberVO,
			RedirectAttributes redirectAttributes) throws Exception {
		
		System.out.println("id = " + memberVO.getId());
		System.out.println("password = " + memberVO.getPassword());
		System.out.println("name = " + memberVO.getName());
		System.out.println("phone = " + memberVO.getPhone());
		
		int cnt = commonService.selectListTotCnt(memberVO, null, null, "memberDAO.selectMemberCnt");
		System.out.println("cnt = " + cnt);
		
		if (cnt > 0) {
			redirectAttributes.addFlashAttribute("msg", "이미 가입된 ID입니다.");
		} else {
			String encpass = BCrypt.hashpw(memberVO.getPassword(), BCrypt.gensalt());
			memberVO.setPassword(encpass);
			
			commonService.insert(memberVO, null, null, "memberDAO.insertMember");
			
			redirectAttributes.addFlashAttribute("msg", "회원가입에 성공하였습니다.");
		}
		
		return "redirect:/member/join.do";
	}
	
	@RequestMapping("/member/checkId.do")
	public ModelAndView checkId(ModelMap model, @ModelAttribute("memberVO") MemberVO memberVO) throws Exception {
		int cnt = commonService.selectListTotCnt(memberVO, null, null, "memberDAO.selectMemberCnt");
		
		if (cnt > 0) {
			model.addAttribute("duplicate", "true");
		} else {
			model.addAttribute("duplicate", "false");
		}
		
		return new ModelAndView(jsonView);
	}
	
	@RequestMapping("/member/actionLogin.do")
	public String actionLogin(
			@ModelAttribute("memberVO") MemberVO memberVO,
			RedirectAttributes redirectAttributes) throws Exception {
		MemberVO loginVO = (MemberVO) commonService.selectView(memberVO, null, null, "memberDAO.selectMemberView");
		
		if (loginVO != null) {
			if (BCrypt.checkpw(memberVO.getPassword(), loginVO.getPassword()) == true) {
				HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
				request.getSession().setAttribute("login", loginVO);
				
				return "redirect:/index.do";
			} else {
				// 비밀번호 불일치
				redirectAttributes.addFlashAttribute("msg", "비밀번호가 맞지 않습니다.");
			}
		} else {
			// ID 존재하지 않음
			redirectAttributes.addFlashAttribute("msg", "존재하지 않는 ID입니다.");
		}
		
		return "redirect:/member/login.do";
	}
	
	@RequestMapping("/member/actionLogout.do")
	public String actionLogout() throws Exception {
		RequestAttributes requestAttribute = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		requestAttribute.setAttribute("login", null, RequestAttributes.SCOPE_SESSION);
		
		return "redirect:/member/login.do";
	}
	
	@RequestMapping("/member/actionLoginAsync.do")
	public ModelAndView actionLoginAsync(ModelMap model, String id, String password) throws Exception {
		
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPassword(password);
		MemberVO loginVO = (MemberVO) commonService.selectView(memberVO, null, null, "memberDAO.selectMemberView");
		
		if (loginVO != null) {
			if (BCrypt.checkpw(memberVO.getPassword(), loginVO.getPassword()) == true) {
				HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
				request.getSession().setAttribute("login", loginVO);
				System.out.println("auth ::   " + loginVO.getAuth());
				
				model.addAttribute("login", "true");
			} else {
				model.addAttribute("login", "false");
			}
		} else {
			model.addAttribute("login", "false");
		}
		
		return new ModelAndView(jsonView);
	}
}
