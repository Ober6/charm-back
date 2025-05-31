[1mdiff --git a/charm-back.iml b/charm-back.iml[m
[1mindex 5289464..1e4703d 100644[m
[1m--- a/charm-back.iml[m
[1m+++ b/charm-back.iml[m
[36m@@ -5,6 +5,7 @@[m
     <content url="file://$MODULE_DIR$">[m
       <sourceFolder url="file://$MODULE_DIR$/src" isTestSource="false" />[m
       <sourceFolder url="file://$MODULE_DIR$/web" isTestSource="false" />[m
[32m+[m[32m      <sourceFolder url="file://$MODULE_DIR$/resources" type="java-resource" />[m
     </content>[m
     <orderEntry type="inheritedJdk" />[m
     <orderEntry type="sourceFolder" forTests="false" />[m
[1mdiff --git a/src/org/ober6/charm/back/controller/ForwardController.java b/src/org/ober6/charm/back/controller/ForwardController.java[m
[1mindex 5787f69..b7d3875 100644[m
[1m--- a/src/org/ober6/charm/back/controller/ForwardController.java[m
[1m+++ b/src/org/ober6/charm/back/controller/ForwardController.java[m
[36m@@ -1,4 +1,19 @@[m
 package org.ober6.charm.back.controller;[m
 [m
[31m-public class ForwardController {[m
[32m+[m
[32m+[m[32mimport jakarta.servlet.ServletException;[m
[32m+[m[32mimport jakarta.servlet.annotation.WebServlet;[m
[32m+[m[32mimport jakarta.servlet.http.HttpServlet;[m
[32m+[m[32mimport jakarta.servlet.http.HttpServletRequest;[m
[32m+[m[32mimport jakarta.servlet.http.HttpServletResponse;[m
[32m+[m
[32m+[m[32mimport java.io.IOException;[m
[32m+[m
[32m+[m[32m@WebServlet("/forward")[m
[32m+[m[32mpublic class ForwardController extends HttpServlet {[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {[m
[32m+[m[32m        req.getRequestDispatcher("/like").forward(req,resp);[m
[32m+[m[32m    }[m
 }[m
[1mdiff --git a/src/org/ober6/charm/back/controller/LikeController.java b/src/org/ober6/charm/back/controller/LikeController.java[m
[1mindex 4724ae0..2cb17b2 100644[m
[1m--- a/src/org/ober6/charm/back/controller/LikeController.java[m
[1m+++ b/src/org/ober6/charm/back/controller/LikeController.java[m
[36m@@ -1,19 +1,68 @@[m
 package org.ober6.charm.back.controller;[m
 [m
[32m+[m[32mimport jakarta.servlet.ServletConfig;[m
 import jakarta.servlet.ServletException;[m
 import jakarta.servlet.annotation.WebServlet;[m
 import jakarta.servlet.http.HttpServlet;[m
 import jakarta.servlet.http.HttpServletRequest;[m
 import jakarta.servlet.http.HttpServletResponse;[m
[32m+[m[32mimport org.ober6.charm.back.service.LikeService;[m
 [m
 import java.io.IOException;[m
[32m+[m[32mimport java.io.PrintWriter;[m
 [m
 @WebServlet("/like")[m
 public class LikeController extends HttpServlet {[m
[32m+[m
[32m+[m[32m    private String servletName;[m
[32m+[m
[32m+[m[32m    private final LikeService likeService = LikeService.getINSTANCE();[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public void init(ServletConfig config) throws ServletException {[m
[32m+[m[32m        this.servletName = config.getServletName();[m
[32m+[m[32m        System.out.println("Init servlet" + config.getServletName());[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {[m
[32m+[m[32m        super.service(req, resp);[m
[32m+[m[32m    }[m
[32m+[m
     @Override[m
     protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {[m
[31m-        resp.setContentType("text/plain");[m
[31m-        resp.getWriter().write("10");[m
[32m+[m[32m        String id = req.getParameter("id");[m
[32m+[m[32m        String answer =  "10";[m
[32m+[m[32m        if(id != null){[m
[32m+[m[32m            long l = Long.parseLong(id);[m
[32m+[m[32m            long answerl = likeService.getLikesById(l);[m
[32m+[m[32m            answer = answerl + "";[m
[32m+[m[32m        }[m
[32m+[m[32m        String userAgent = req.getHeader("User-Agent");[m
[32m+[m[32m        resp.setContentType("text/html");[m
[32m+[m[32m        resp.setCharacterEncoding("UTF-8");;[m
[32m+[m[32m        try(PrintWriter writer = resp.getWriter()) {[m
[32m+[m[32m            writer.write("<h2>");[m
[32m+[m[32m            writer.write("<p>");[m
[32m+[m[32m            writer.write("Answer"+answer);[m
[32m+[m[32m            writer.write("</p>");[m
[32m+[m[32m            writer.write("<p>");[m
[32m+[m[32m            writer.write("Header userAgent"+userAgent);[m
[32m+[m[32m            writer.write("</p>");[m
[32m+[m[32m            writer.write("<p>");[m
[32m+[m[32m            writer.write("request URI"+req.getRequestURI());[m
[32m+[m[32m            writer.write("</p>");[m
[32m+[m[32m            writer.write("</h2>");[m
[32m+[m[32m        }[m
     }[m
 [m
[32m+[m[32m    @Override[m
[32m+[m[32m    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {[m
[32m+[m[32m        super.doPost(req, resp);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public void destroy() {[m
[32m+[m[32m        System.out.println("Destroy servlet " + servletName);[m
[32m+[m[32m    }[m
 }[m
[1mdiff --git a/src/org/ober6/charm/back/service/LikeService.java b/src/org/ober6/charm/back/service/LikeService.java[m
[1mindex 9ef5961..7d7d9b0 100644[m
[1m--- a/src/org/ober6/charm/back/service/LikeService.java[m
[1m+++ b/src/org/ober6/charm/back/service/LikeService.java[m
[36m@@ -1,4 +1,18 @@[m
 package org.ober6.charm.back.service;[m
 [m
 public class LikeService {[m
[32m+[m
[32m+[m[32m    private static final LikeService INSTANCE = new LikeService();[m
[32m+[m
[32m+[m[32m    private LikeService(){[m
[32m+[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public static LikeService getINSTANCE() {[m
[32m+[m[32m        return INSTANCE;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public long getLikesById(long id){[m
[32m+[m[32m        return 10 + id;[m
[32m+[m[32m    }[m
 }[m
