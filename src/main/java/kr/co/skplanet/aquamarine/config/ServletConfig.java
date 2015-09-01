package kr.co.skplanet.aquamarine.config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;

import kr.co.skplanet.aquamarine.presentation.interceptor.AuthInterceptor;

/**
 * <p>Servlet 설정 (Java-based)
 * 
 * @author skplanet
 *
 */
@Configuration
@EnableWebMvc
// @EnableAsync
@ComponentScan(basePackages = "kr.co.skplanet.aquamarine.presentation.controller")
public class ServletConfig extends WebMvcConfigurerAdapter {

	@SuppressWarnings("unused")
	@Autowired
	private Environment env;

	/**
	 * 로그인 인터셉터 등록
	 * 
	 * @return HandlerInterceptor(AuthInterceptor)
	 */
	@Bean
	public HandlerInterceptor authInterceptor() {
		return new AuthInterceptor();
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(authInterceptor())
				.addPathPatterns("/**/*")
				.excludePathPatterns("/login.do");
		
	}
	
//	@Bean
//	public ViewResolver internalResourceViewResolver() {
//
//		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
//
//		viewResolver.setPrefix("/WEB-INF/jsp/");
//		viewResolver.setSuffix(".jsp");
//		viewResolver.setOrder(0);
//
//		return viewResolver;
//
//	}

	@Override
	public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {

		super.configureContentNegotiation(configurer);
		configurer.favorPathExtension(false)
				  .favorParameter(true)
				  .parameterName("mediaType")
				  .ignoreAcceptHeader(true)
				  .useJaf(false)
				  .defaultContentType(MediaType.APPLICATION_JSON)
				  .mediaType("xml", MediaType.APPLICATION_XML)
				  .mediaType("json", MediaType.APPLICATION_JSON);

	}

	@Bean
	public ViewResolver viewResolver() {

		ContentNegotiatingViewResolver contentNegotiatingViewResolver = new ContentNegotiatingViewResolver();
		contentNegotiatingViewResolver.setViewResolvers(viewResolvers());
		contentNegotiatingViewResolver.setDefaultViews(defaultView());

		return contentNegotiatingViewResolver;

	}

	private List<View> defaultView() {
		
		return Arrays.<View> asList(new MappingJackson2JsonView());
		
	}

	private List<ViewResolver> viewResolvers() {
		
		InternalResourceViewResolver jspViewResolver = new InternalResourceViewResolver();
		
		jspViewResolver.setPrefix("/WEB-INF/jsp/");
		jspViewResolver.setSuffix(".jsp");
		jspViewResolver.setOrder(0);

		List<ViewResolver> viewResolvers = new ArrayList<ViewResolver>();
		viewResolvers.add(jspViewResolver);

		return viewResolvers;
	}

	@Bean
	public TilesConfigurer tilesConfigurer() {
		
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] { "/WEB-INF/tiles.xml" });
		
		return tilesConfigurer;
		
	}
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {

		String[] staticPageUris = new String[] { "/home" };

		for (String uri : staticPageUris)
			registry.addViewController(uri + ".do").setViewName(StringUtils.removeStart(uri, "/"));

	}
	
}
