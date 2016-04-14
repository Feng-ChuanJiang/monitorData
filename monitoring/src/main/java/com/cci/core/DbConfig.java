package com.cci.core;/*package com.cci.core;

import com.mysql.jdbc.Driver;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.SQLException;

public class DbConfig {

    @Autowired
    private Environment env;

//    @Bean
//    public DataSource dataSource() {
//        JndiObjectFactoryBean jndiFactory = new JndiObjectFactoryBean();
//        jndiFactory.setJndiName("jdbc/cci");
//        jndiFactory.setCache(true);
//        jndiFactory.setProxyInterface(DataSource.class);
//        return (DataSource) jndiFactory.getObject();
//    }

//    @Bean
//    public DataSource dataSource(){
//        Driver driver = null;
//        try {
//            driver = new Driver();
//        } catch (SQLException e) {
//        }
//        String url="jdbc:mysql://localhost:3306/person";
//        String username="root";
//        String password="root";
//        DataSource dataSource = new SimpleDriverDataSource(driver,url,username,password);
//        return dataSource;
//    }

//    @Bean
//    public SqlSessionFactoryBean sqlSessionFactory() {
//        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
//        sqlSessionFactoryBean.setDataSource(dataSource());
//        sqlSessionFactoryBean.setMapperLocations(new ClassPathResource[]{new ClassPathResource
//                ("config/mybatis/PersonMapper.xml")});
//        return sqlSessionFactoryBean;
//    }

//    @Bean
//    public MapperScannerConfigurer mapperScannerConfigurer() {
//        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
//        mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
//        mapperScannerConfigurer.setAnnotationClass(Repository.class);
//        mapperScannerConfigurer.setBasePackage("com.cci.**.repository");
//        return mapperScannerConfigurer;
//    }
}
*/