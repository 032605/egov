package egovframework.com.test.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import egovframework.com.test.service.TestService;
import egovframework.com.test.service.TestVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("testService")
public class TestServiceImpl extends EgovAbstractServiceImpl implements TestService {
	
	@Resource(name = "testDAO")
	private TestDAO testDAO;
	
	public List<?> selectList(TestVO testVO, HttpServletRequest req, HttpServletResponse res){
		return testDAO.selectList("testDAO.selectTestList", testVO);
	}
}
