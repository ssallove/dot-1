package kr.co.skplanet.aquamarine.service;

import java.util.List;

import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.AttributesMapper;
import org.springframework.ldap.core.ContextMapper;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.filter.AndFilter;
import org.springframework.ldap.filter.EqualsFilter;
import org.springframework.stereotype.Service;

import kr.co.skplanet.aquamarine.model.AccountVO;

/**
 * @author skplanet
 *
 */
@Service
// @Lazy
public class LdapService {

	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(LdapService.class);

	@Autowired
	private LdapTemplate ldapTemplate;

	public List<?> getLdapPeople() {

		return ldapTemplate.search("", "(objectclass=Person)", new AttributesMapper<Object>() {

			@Override
			public Object mapFromAttributes(final Attributes attrs) throws NamingException {

				return attrs.get("cn")
							.get();

			}

		});

	}

	public boolean authenticate(final String userId,
								final String password) {

		AndFilter filter = new AndFilter();
		filter.and(new EqualsFilter("cn", userId));

		return ldapTemplate.authenticate("", filter.toString(), password);

	}

	public boolean login(final AccountVO account,
						 final String password) {

		String userId = account.getUserId();

		if (authenticate(userId, password)) {

			AndFilter filter = new AndFilter();
			filter.and(new EqualsFilter("cn", userId));

			ldapTemplate.searchForObject("", filter.toString(), new ContextMapper<Object>() {

				@Override
				public Object mapFromContext(final Object ctx) throws NamingException {

					DirContext dirCtx = (DirContext) ctx;

					Attributes attrs = dirCtx.getAttributes("", new String[] { "mail", "exADKoreanName", "exADExternalMailAddress", "department" });

					// account.setUserId((String) attrs.get("cn")
					// .get());

					Attribute attr = null;

					attr = attrs.get("exADKoreanName");

					if (attr != null && StringUtils.isNotBlank(ObjectUtils.toString(attr.get())))
						account.setUserName((String) attr.get());
					else
						account.setUserName(account.getUserId());

					attr = attrs.get("mail");

					if (attr != null && StringUtils.isNotBlank(ObjectUtils.toString(attr.get())))
						account.setEmail((String) attr.get());
					else {

						attr = attrs.get("exADExternalMailAddress");

						if (attr != null && StringUtils.isNotBlank(ObjectUtils.toString(attr.get())))
							account.setEmail((String) attr.get());

					}

					attr = attrs.get("department");

					if (attr != null && StringUtils.isNotBlank(ObjectUtils.toString(attr.get())))
						account.setDepartment((String) attr.get());

					return null;

				}

			});

			return true;

		} else
			return false;

	}

}
