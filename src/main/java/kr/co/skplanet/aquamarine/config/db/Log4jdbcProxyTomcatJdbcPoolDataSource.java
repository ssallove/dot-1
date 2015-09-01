package kr.co.skplanet.aquamarine.config.db;

import org.apache.tomcat.jdbc.pool.DataSource;

import net.sf.log4jdbc.Log4jdbcProxyDataSource;

/**
 * <p>{@link Log4jdbcProxyDataSource} 에 close 메소드가 구현되어 있지 않아, 상속하여 close 메소드 추가 
 * @author 이도현
 *
 */
public class Log4jdbcProxyTomcatJdbcPoolDataSource extends Log4jdbcProxyDataSource {

	private DataSource tomcatJdbcPoolDataSource;

	public Log4jdbcProxyTomcatJdbcPoolDataSource(DataSource tomcatJdbcPoolDataSource) {

		super(tomcatJdbcPoolDataSource);
		this.tomcatJdbcPoolDataSource = tomcatJdbcPoolDataSource;

	}

	public void close() {

		tomcatJdbcPoolDataSource.close();

	}

}
