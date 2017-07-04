package com.neusoft.controller.front;

import com.neusoft.mapper.BlogUserMapper;
import com.neusoft.model.BlogUser;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Created by DMT001 on 2017/7/3.
 */
@Controller
public class HomeController {

    private BlogUserMapper blogUserMapper;

    public HomeController() throws IOException {
        InputStream inputStream = Resources.getResourceAsStream("SqlMapConfig.xml");
        //创建会话工厂,传入Mybatis的配置文件信息
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        blogUserMapper = sqlSession.getMapper(BlogUserMapper.class);
    }
    @RequestMapping("home.do")
    public ModelAndView home()
    {
        ModelAndView mav = new ModelAndView();

        List<BlogUser> lstUsers = blogUserMapper.getAllUser();
        mav.addObject("allUsers",lstUsers);
        mav.setViewName("home.jsp");
        return mav;
    }

    @RequestMapping("user_home.do")
    public ModelAndView user_home()
    {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("user_home.htm");
        return mav;
    }

    @RequestMapping("reg.do")
    public ModelAndView reg()
    {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("reg.htm");
        return mav;
    }

    @RequestMapping("login.do")
    public ModelAndView login()
    {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login.jsp");
        return mav;
    }

    @RequestMapping("article_detail.do")
    public ModelAndView article_detail()
    {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("article_detail.htm");
        return mav;
    }
    @RequestMapping("reg_user.do")
    public ModelAndView reg_user(BlogUser blogUser)  {

        blogUserMapper.regUser(blogUser);

        ModelAndView mav = new ModelAndView();
        mav.addObject("username",blogUser.getUsername());
        mav.setViewName("admin_user_home.jsp");
        return mav;
    }



    @RequestMapping("user_login.do")
    public ModelAndView user_login(BlogUser blogUser
            , HttpServletRequest request
            , HttpServletResponse response) {
;
        ModelAndView mav = new ModelAndView();

        HttpSession httpSession = request.getSession();
        List<BlogUser> lstUsers = blogUserMapper.loginUser(blogUser);
        if(lstUsers.size()==0)//登录失败
        {
            mav.addObject("msg","用户名密码不对");
            mav.setViewName("login.jsp");
        }
        else//登录成功
        {
            httpSession.setAttribute("login_user",blogUser);
          //  mav.addObject("login_user",blogUser.getUsername());
            mav.setViewName("home.jsp");
        }


        return mav;
    }

}
