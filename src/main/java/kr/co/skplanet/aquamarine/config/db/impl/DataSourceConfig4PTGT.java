package kr.co.skplanet.aquamarine.config.db.impl;

import javax.management.ObjectName;
import javax.sql.DataSource;

import org.apache.commons.lang3.time.DateUtils;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import kr.co.skplanet.aquamarine.config.db.DataSourceConfig;
import kr.co.skplanet.aquamarine.config.db.Log4jdbcProxyTomcatJdbcPoolDataSource;
import net.sf.log4jdbc.tools.Log4JdbcCustomFormatter;
import net.sf.log4jdbc.tools.LoggingType;

/**
 * <p>PTGT DB 설정을 위한 {@link DataSourceConfig} 구현체
 * @author 이도현
 *
 */
@Configuration
public class DataSourceConfig4PTGT implements DataSourceConfig {

	private static final Logger LOG = LoggerFactory.getLogger(DataSourceConfig4PTGT.class);

	public static final String QUALIFIER = "ptgt";

	/*
	 * (non-Javadoc)
	 * 
	 * @see kr.co.skplanet.aquamarine.config.db.DataSourceConfig#dataSource(java.lang.String, java.lang.String, java.lang.String, java.lang.String, int, int, int, int, boolean, boolean)
	 */
	@Override
	@Bean(name = "dataSource." + QUALIFIER, destroyMethod = "close")
	@Qualifier(QUALIFIER)
	@Lazy
	public DataSource dataSource(@Value("${jdbc." + QUALIFIER + ".driver.class}") final String driverClassName,
								 @Value("${jdbc." + QUALIFIER + ".url}") final String url,
								 @Value("${jdbc." + QUALIFIER + ".username}") final String userName,
								 @Value("${jdbc." + QUALIFIER + ".password}") final String password,
								 @Value("${jdbc." + QUALIFIER + ".pool.init}") final int initPoolSize,
								 @Value("${jdbc." + QUALIFIER + ".pool.max}") final int maxPoolSize,
								 @Value("${jdbc." + QUALIFIER + ".pool.min}") final int minPoolSize,
								 @Value("${jdbc." + QUALIFIER + ".pool.max.wait.millis}") final int maxWaitMillis,
								 @Value("${jdbc." + QUALIFIER + ".pool.mbean.monitoring}") final boolean isMonitoring,
								 @Value("${jdbc." + QUALIFIER + ".use.sql.formatter}") final boolean isUseSqlFormatter,
								 @Value("${jdbc." + QUALIFIER + ".skip.exception.on.startup}") final boolean isSkipExceptionOnStartup) {

		org.apache.tomcat.jdbc.pool.DataSource dataSource = new org.apache.tomcat.jdbc.pool.DataSource();

		dataSource.setDriverClassName(driverClassName);
		dataSource.setUrl(url);
		dataSource.setUsername(userName);
		dataSource.setPassword(password);
		dataSource.setInitialSize(initPoolSize);
		dataSource.setMaxActive(maxPoolSize);
		dataSource.setMaxIdle(maxPoolSize);

		dataSource.setMinIdle(1);

		/*
		 * Tomcat DBCP 특화설정
		 */
		dataSource.setMaxWait(maxWaitMillis); // 유휴 커넥션이 없을 경우, 새로운 요청은 설정된 시간 만큼만 대기
		dataSource.setDefaultReadOnly(true);

		// 커넥션 풀 정리 스레드 실행간격
		dataSource.setTimeBetweenEvictionRunsMillis((int) DateUtils.MILLIS_PER_MINUTE);

		// 유휴 커넥션은 다음 설정된 시간이 지나면 해제
		dataSource.setMinEvictableIdleTimeMillis(10 * (int) DateUtils.MILLIS_PER_MINUTE);

		// 커넥션 테스트 설정 : high fault tolerance, but high load..
		dataSource.setValidationQuery("SELECT 1 FROM DUAL");
		dataSource.setTestWhileIdle(true);
		dataSource.setTestOnBorrow(true);
		dataSource.setTestOnReturn(false);
		dataSource.setValidationInterval(DateUtils.MILLIS_PER_SECOND * 3);
		dataSource.setLogValidationErrors(true);

		// 커넥션 테스트 설정 : low load, but low fault tolerance..
		/*
		 * dataSource.setValidationQuery("SELECT 1 FROM DUAL"); dataSource.setTestWhileIdle(true); dataSource.setTestOnBorrow(false); dataSource.setTestOnReturn(false); dataSource.setValidationInterval(260 * DateUtils.MILLIS_PER_SECOND); dataSource.setLogValidationErrors(true);
		 */

		// 풀로 반환되지 않은 커넥션에 대한 설정
		dataSource.setRemoveAbandoned(true);
		dataSource.setAbandonWhenPercentageFull(50);
		dataSource.setRemoveAbandonedTimeout(2 * 60); // 해당 시간 이상 반환되지 않으면 강제 종료 후, 로그를 남기거나 말거나
		// dataSource.setSuspectTimeout(300); //해당 시간 이상 반환되지 않으면, 로그를 남기거나 말거나
		dataSource.setLogAbandoned(true);

		// dataSource.setInitSQL("SELECT 1 FROM DUAL");

		try {

			dataSource.createPool();

			if (isMonitoring)
				dataSource.preRegister(null, new ObjectName("bean:name=ConnectionPool@" + QUALIFIER));

		} catch (Exception e) {

			if (isSkipExceptionOnStartup)
				LOG.error(e.getMessage(), e);
			else
				throw new RuntimeException(e);

		}

		if (isUseSqlFormatter) {

			Log4JdbcCustomFormatter formatter = new Log4JdbcCustomFormatter();
			formatter.setLoggingType(LoggingType.MULTI_LINE);
			formatter.setSqlPrefix("SQL:\r");
			Log4jdbcProxyTomcatJdbcPoolDataSource dataSourceProxy = new Log4jdbcProxyTomcatJdbcPoolDataSource(dataSource);
			dataSourceProxy.setLogFormatter(formatter);

			return dataSourceProxy;

		} else
			return dataSource;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see kr.co.skplanet.aquamarine.config.db.DataSourceConfig#transactionManager(javax.sql.DataSource)
	 */
	@Override
	@Bean(name = "transactionManager." + QUALIFIER)
	@Qualifier(QUALIFIER)
	@Lazy
	public PlatformTransactionManager transactionManager(@Qualifier(QUALIFIER) final DataSource dataSource) {
		return new DataSourceTransactionManager(dataSource);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see kr.co.skplanet.aquamarine.config.db.DataSourceConfig#sqlSessionFactory(javax.sql.DataSource, java.lang.String)
	 */
	@Override
	@Bean(name = "sqlSessionFactory." + QUALIFIER)
	@Lazy
	@Qualifier(QUALIFIER)
	public SqlSessionFactory sqlSessionFactory(@Qualifier(QUALIFIER) final DataSource dataSource,
											   @Value("${mybatis.config." + QUALIFIER + ".classpath}") final String configFilePath) {

		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();

		sqlSessionFactoryBean.setDataSource(dataSource);
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource(configFilePath));

		try {
			return sqlSessionFactoryBean.getObject();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see kr.co.skplanet.aquamarine.config.db.DataSourceConfig#sqlSessionTemplate(org.apache.ibatis.session.SqlSessionFactory)
	 */
	@Override
	@Bean(name = "sqlSessionTemplate." + QUALIFIER, destroyMethod = "")
	@Lazy
	@Qualifier(QUALIFIER)
	public SqlSessionTemplate sqlSessionTemplate(@Qualifier(QUALIFIER) final SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}

}
