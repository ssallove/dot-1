package kr.co.skplanet.aquamarine.persistence;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Qualifier;

import kr.co.skplanet.aquamarine.config.db.impl.DataSourceConfig4PTGT;

/**
 * <p>PTGT DB에 접속하는 DAO 를 위한 추상 클래스
 * 
 * @author skplanet
 * 
 */
public abstract class AbstractDao4PTGT extends AbstractDao {

	public static String DB_NAME;

	@Override
	@Resource
	public final void setSqlSessionTemplate(@Qualifier(DataSourceConfig4PTGT.QUALIFIER) final SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

}
