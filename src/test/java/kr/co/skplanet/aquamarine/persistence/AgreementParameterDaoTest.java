package kr.co.skplanet.aquamarine.persistence;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.skplanet.aquamarine.config.RootContextConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { RootContextConfig.class })
public class AgreementParameterDaoTest {

	@Autowired
	private AgreementParameterDao agreementParameterDao;

	@Test
	public void testSelectEachServiceCrossIntersect() {

		List<Map<String, ?>> list = agreementParameterDao.selectEachServiceCrossIntersect();

		assertNotNull(list);

	}

}
