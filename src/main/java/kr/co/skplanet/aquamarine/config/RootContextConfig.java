package kr.co.skplanet.aquamarine.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.core.support.LdapContextSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import kr.co.skplanet.aquamarine.config.db.impl.DataSourceConfig4PTGT;

/**
 * <p>Java 기반 Context 설정 (Java-based)
 * 
 * @author skplanet
 *
 */
@Configuration
@Import({ DataSourceConfig4PTGT.class })
@PropertySource({ "classpath:/application.properties", "classpath:/server-side-dependencies.properties" })
@ComponentScan(basePackages = { "kr.co.skplanet.aquamarine" })
@EnableTransactionManagement
public class RootContextConfig {

//	@Autowired
//	private Environment env;

	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	@Bean
	@Lazy
	public LdapTemplate ldapTemplate(@Value("${ldap.url}") final String url,
									 @Value("${ldap.base}") final String base,
									 @Value("${ldap.user.dn}") final String userDn,
									 @Value("${ldap.password}") final String password) {

		LdapContextSource ldapContextSource = new LdapContextSource();

		ldapContextSource.setUrl(url);
		ldapContextSource.setBase(base);
		ldapContextSource.setUserDn(userDn);
		ldapContextSource.setPassword(password);

		LdapTemplate template = new LdapTemplate(ldapContextSource);

		return template;

	}

}
