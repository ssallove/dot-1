package kr.co.skplanet.aquamarine.config.db;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.transaction.PlatformTransactionManager;

/**
 * <p>DB 관련 빈 설정(데이터소스, 트랜잭션, MyBatis 관련 빈)을 템플릿화 하는 인터페이스
 * 
 * @author 이도현
 * @since 2014. 9. 20.
 *
 */
public interface DataSourceConfig {

	/**
	 * <p>데이터 소스 빈 생성
	 * @param driverClassName
	 * @param url
	 * @param userName
	 * @param password
	 * @param initPoolSize
	 * @param maxPoolSize
	 * @param minPoolSize
	 * @param maxWaitMillis
	 * @param isMonitoring
	 * @param isSkipExceptionOnStartup
	 * @return 데이터소스 빈
	 */
	DataSource dataSource(String driverClassName,
						  String url,
						  String userName,
						  String password,
						  int initPoolSize,
						  int maxPoolSize,
						  int minPoolSize,
						  int maxWaitMillis,
						  boolean isMonitoring,
						  boolean isUseSqlFormatter,
						  boolean isSkipExceptionOnStartup);

	/**
	 * <p>트랜잭션 매니저 빈 생성
	 * @param dataSource
	 * @return PlatformTransactionManager 트랜잭션 매니저 빈
	 */
	PlatformTransactionManager transactionManager(DataSource dataSource);

	/**
	 * <p>MyBatis SqlSessionFactory 생성
	 * @param dataSource
	 * @return SqlSessionFactory
	 */
	SqlSessionFactory sqlSessionFactory(DataSource dataSource,
										String configFilePath);

	/**
	 * <p>MyBatis SqlSessionTemplate 생성
	 * @param sqlSessionFactory
	 * @return SqlSessionTemplate
	 */
	SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory);

}
