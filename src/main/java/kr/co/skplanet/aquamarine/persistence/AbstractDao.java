package kr.co.skplanet.aquamarine.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.support.DaoSupport;

/**
 * @author skplanet
 *
 */
public abstract class AbstractDao extends DaoSupport {

	private SqlSession sqlSession;

	public final SqlSession getSqlSession() {
		return this.sqlSession;
	}

	@Resource
	public void setSqlSessionTemplate(final SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSession = sqlSessionTemplate;
	}

	@Override
	protected void checkDaoConfig() {
	}

	public <E> List<E> paginate(Map<String, Object> params,
								final String selectSqlId,
								final int page,
								final int count) {

		int startRowNo = count * (page - 1) + 1;

		if (params == null)
			params = new HashMap<String, Object>();

		params.put("pageOffset", startRowNo);
		params.put("pageCount", count);

		return getSqlSession().<E> selectList(selectSqlId, params);

	}

}
