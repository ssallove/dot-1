package kr.co.skplanet.aquamarine.service;

import java.util.List;

import javax.naming.NamingException;
import javax.naming.directory.Attributes;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.AttributesMapper;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.filter.AndFilter;
import org.springframework.ldap.filter.EqualsFilter;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import kr.co.skplanet.aquamarine.model.AccountVO;

/**
 * @author skplanet
 *
 */
@Service
// @Lazy
public class LdapService {

	private static final Logger LOG = LoggerFactory.getLogger(LdapService.class);

	@Autowired
	private LdapTemplate ldapTemplate;

	public List<?> getLdapPersons() {

		return ldapTemplate.search("", "(objectclass=Person)", new AttributesMapper<Object>() {

			@Override
			public Object mapFromAttributes(final Attributes attrs) throws NamingException {

				return attrs.get("cn")
							.get();

			}

		});

	}

	public boolean authenticate(final String username,
								final String password) {

		AndFilter filter = new AndFilter();
		filter.and(new EqualsFilter("cn", username.toUpperCase()));

		LOG.debug("## filter=" + filter.toString());

		return ldapTemplate.authenticate("", filter.toString(), password);

	}

	public AccountVO login(final String username,
						   final String password) {

		if (authenticate(username, password)) {

			AndFilter filter = new AndFilter();
			filter.and(new EqualsFilter("cn", username));

			List<AccountVO> result = ldapTemplate.search("", filter.toString(), new AttributesMapper<AccountVO>() {

				@Override
				public AccountVO mapFromAttributes(final Attributes attrs) throws NamingException {
					return makeUserUsingLdapAttrs(attrs);
				}

			});

			if (!CollectionUtils.isEmpty(result))
				return result.get(0);
			else
				return null;

		} else
			return null;

	}

	// public AccountVO getUser(String username) {
	//
	// AndFilter filter = new AndFilter();
	//
	// filter.and(new EqualsFilter("objectclass", "Person"))
	// .and(new EqualsFilter("cn", username));
	//
	// List<AccountVO> result = ldapTemplate.search("", filter.toString(), new AttributesMapper<AccountVO>() {
	//
	// @Override
	// public AccountVO mapFromAttributes(Attributes attrs) throws NamingException {
	// return makeUserUsingLdapAttrs(attrs);
	// }
	//
	// });
	//
	// if (!CollectionUtils.isEmpty(result))
	// return result.get(0);
	// else
	// return null;
	//
	// }

	private AccountVO makeUserUsingLdapAttrs(final Attributes attrs) throws NamingException {

		AccountVO user = new AccountVO();

		if (attrs != null) {

			user.setUser_nm(StringUtils.defaultIfEmpty((String) attrs.get("cn")
																	 .get(),
													   StringUtils.EMPTY));

			if (attrs.get("ExADKoreanName") != null) {
				user.setFullname((String) attrs.get("ExADKoreanName")
											   .get());
			} else {
				user.setFullname(user.getUser_nm());
			}

			if (attrs.get("mail") != null)
				user.setEmail((String) attrs.get("mail")
											.get());
			if (attrs.get("mobile") != null)
				user.setMobile((String) attrs.get("mobile")
											 .get());
		}

		return user;

	}

}
