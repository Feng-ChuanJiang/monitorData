package com.cci.core;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.ImportResource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;


@Configuration
//@EnableWebMvc
//@ComponentScan(basePackages="com.cci.oms.*")
@EnableTransactionManagement
@EnableAspectJAutoProxy(proxyTargetClass = true)
@ImportResource("classpath*:spring-mvc.xml")

//@ImportResource("classpath*:application*.xml")
//@PropertySource("classpath*:application*.properties")
public class AppConfig {
	
	@Bean
	public CommonsMultipartResolver multipartResolver(){
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		
		return multipartResolver;
	}
	
//	@Bean
//	public InternalResourceViewResolver internalResourceViewResolver(){
//		return new InternalResourceViewResolver();
//	}
	
//	@Bean
//	public TilesConfigurer tilesConfigurer() {
//		TilesConfigurer tilesConfigurer = new TilesConfigurer();
//		tilesConfigurer.setDefinitions(new String[]{"classpath*:config/tiles/website-tiles.xml",
//				"classpath*:config/tiles/common-tiles.xml"});
//		return tilesConfigurer;
//	}
//
//	@Bean
//	public TilesViewResolver viewResolver() {
//		return new TilesViewResolver();
//	}

}
