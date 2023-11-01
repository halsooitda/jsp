package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import orm.DatabaseBuilder;

public class MemberDAOImpl implements MemberDAO {
	private static final Logger log = LoggerFactory.getLogger(BoardDAOImpl.class);
	private SqlSession sql;
	private final String NS = "MemberMapper."; 
	int isOk;
	
	public MemberDAOImpl() {
		new DatabaseBuilder();
		sql = DatabaseBuilder.getFactory().openSession();
	}
	
	@Override
	public int join(MemberVO mvo) {
		isOk = sql.insert(NS+"join", mvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		return sql.selectOne(NS+"login", mvo);
	}

	@Override
	public int lastLogin(String id) {
		isOk = sql.update(NS+"last", id);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public List<MemberVO> getList() {
		return sql.selectList(NS+"list");
	}

	@Override
	public int update(MemberVO mvo) {
		isOk = sql.update(NS+"up", mvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int delete(String id) {
		isOk = sql.delete(NS+"del", id);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}


}
