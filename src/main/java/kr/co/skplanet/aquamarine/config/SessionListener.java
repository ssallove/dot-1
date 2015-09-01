package kr.co.skplanet.aquamarine.config;

import java.util.Date;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <p>web.xml 의 listener 설정에 의해 등록됨
 * 
 * @author skplanet
 *
 */
public class SessionListener implements HttpSessionListener {

    private static final Logger LOG = LoggerFactory.getLogger(SessionListener.class);

    @Override
    public void sessionCreated(HttpSessionEvent event) {

        LOG.info("세션 생성 : {}", "Session ID".concat(event.getSession().getId()).concat(" created at ").concat(new Date().toString()));

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {

        LOG.info("세션 만료 : {}", "Session ID".concat(event.getSession().getId()).concat(" destroyed at ").concat(new Date().toString()));

    }
}
