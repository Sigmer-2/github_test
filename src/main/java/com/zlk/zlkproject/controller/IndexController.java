package com.zlk.zlkproject.controller;

import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.entity.*;

import com.zlk.zlkproject.enums.ArticleStatus;

import com.zlk.zlkproject.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户的controller
 *
 * @author 言曌
 * @date 2017/8/24
 */
@Controller
public class IndexController {

    @Autowired
    private ArticleService articleService;


    @Autowired
    private TagService tagService;
    //瀑布流加载
    @RequestMapping("/flow")
    @ResponseBody
    public Map<String,Object> flow(Integer page,Integer limit)throws Exception{
        HashMap<String, Object> criteria = new HashMap<>(1);
        criteria.put("status", ArticleStatus.PUBLISH.getValue());
        //文章列表
        PageInfo<Article> articleList = articleService.pageArticle1(page,limit,criteria);
        Integer pages = articleService.countArticle(1)/limit+1;
       // System.out.println(articleService.countArticle(1));
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("data",articleList);
        map.put("pages",pages);
        return map;
    }
    //全部查询
    @RequestMapping(value = {"/", "/article"})
    public String index(@RequestParam(required = false, defaultValue = "1") Integer pageIndex,
                        @RequestParam(required = false, defaultValue = "10") Integer pageSize, Model model) {
        HashMap<String, Object> criteria = new HashMap<>(1);
        criteria.put("status", ArticleStatus.PUBLISH.getValue());
        //文章列表
        PageInfo<Article> articleList = articleService.pageArticle(pageIndex, pageSize, criteria);
        model.addAttribute("pageInfo", articleList);



        //侧边栏显示
        //标签列表显示
        List<Tag> allTagList = tagService.listTag();
        model.addAttribute("allTagList", allTagList);
        model.addAttribute("pageUrlPrefix", "/article?pageIndex");
        return "Home/index";
    }


    @RequestMapping("/404")
    public String NotFound(@RequestParam(required = false) String message, Model model) {
        model.addAttribute("message", message);
        return "Home/Error/404";
    }

    @RequestMapping("/500")
    public String ServerError(@RequestParam(required = false) String message, Model model) {
        model.addAttribute("message", message);
        return "Home/Error/500";
    }


}




