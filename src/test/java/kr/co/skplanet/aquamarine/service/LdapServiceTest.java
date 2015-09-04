package kr.co.skplanet.aquamarine.service;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.skplanet.aquamarine.config.RootContextConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { RootContextConfig.class })
public class LdapServiceTest {
	
	@Autowired
	private LdapService ldapService;
	
	private String username = "PP13521";
	private String password = "!SKP3521";
	
//	private String username = "1002405";
//	private String password = "9138007!krkimsh";

	@Test
	public void testGetLdapPersons() {
		
		List<?> ldapAccountList = ldapService.getLdapPersons();
		boolean isFind = false;
		List<String> partnerList = new ArrayList<String>();
//		
		Pattern pattern = Pattern.compile("^pp", Pattern.CASE_INSENSITIVE);
		
		for(Object obj : ldapAccountList){
			
			String username = (String)obj;
			
			if(!isFind)
				isFind = username.equalsIgnoreCase(this.username);
			
			if(pattern.matcher(username).find())
				partnerList.add(username);
			
		}
		
		assertTrue(isFind);

	}

	@Test
	public void testAuthenticate() {
		
		assertTrue(ldapService.authenticate(username, password.toLowerCase()));
		
	}

	@Test
	public void testLogin() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetUser() {
		fail("Not yet implemented");
	}

}
