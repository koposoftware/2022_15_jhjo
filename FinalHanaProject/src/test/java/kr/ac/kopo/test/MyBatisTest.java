package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;


@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
public class MyBatisTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Test
	public void mybatistT() {
		assertNotNull(sqlSessionTemplate);
	}

}