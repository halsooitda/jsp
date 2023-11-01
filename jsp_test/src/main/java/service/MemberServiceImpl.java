package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import repository.MemberDAO;
import repository.MemberDAOImpl;

public class MemberServiceImpl implements MemberService {
	private static final Logger log = 
			LoggerFactory.getLogger(MemberServiceImpl.class);
	private MemberDAO mdao;
	
	public MemberServiceImpl() {
		mdao = new MemberDAOImpl();
	}

	@Override
	public int join(MemberVO mvo) {
		return mdao.join(mvo);
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		return mdao.login(mvo);
	}

	@Override
	public int lastLogin(String id) {
		return mdao.lastLogin(id);
	}

	@Override
	public List<MemberVO> getList() {
		return mdao.getList();
	}

	@Override
	public int update(MemberVO mvo) {
		return mdao.update(mvo);
	}

	@Override
	public int delete(String id) {
		return mdao.delete(id);
	}


}
