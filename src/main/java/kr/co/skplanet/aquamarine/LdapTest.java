package kr.co.skplanet.aquamarine;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import kr.co.skplanet.aquamarine.config.RootContextConfig;
import kr.co.skplanet.aquamarine.service.LdapService;

public class LdapTest {
	
	private static final Logger LOG = LoggerFactory.getLogger(LdapTest.class);
	private static AnnotationConfigApplicationContext appCtx = null;

	public static void main(String[] args) {
		
		String username = args[0], password = args[1];

		Runtime.getRuntime()
		   .addShutdownHook(new Thread() {

			   @Override
			   public void run() {
				   appCtx.close();
			   }

		   });

		
		appCtx = new AnnotationConfigApplicationContext(RootContextConfig.class);
		
		LdapService ldapService = appCtx.getBean(LdapService.class);
		
		LOG.info("Try to login by {} / {}", username, password);
		
		if(ldapService.authenticate(username, password))
			LOG.info("LDAP login : SUCCESS");
		else
			LOG.info("LDAP login : FAILURE");
		
		System.exit(0);
		
	}

}
