<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>浏览帖子</title>


    <link rel="shortcut icon"
          href="${pageContext.request.contextPath }/images/favicon.ico">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/layui/css/layui.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/css/font.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/css/globall.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/css/tp5page.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/css/mycss.css">
    <script
            src="https://hm.baidu.com/hm.js?8809b1cab8e955d96e2d72b31e9d460c"></script>
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>


    <script type="text/javascript">
        function toPage(orderBy) {
            var value = $(".zhuandao-input").val();
            window.location.href = "${pageContext.request.contextPath}/cart/cartList.html?currentPage="
                + value + "&orderBy=" + orderBy + "&typeId=${typeId}";
        }
    </script>


</head>

<body>
<script>
    (function () {
        var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec"
            : "https://jspassport.ssl.qhimg.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec";
        document.write('<script src="' + src + '" id="sozz"><\/script>');
    })();
</script>
<script
        src="http://js.passport.qihucdn.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec"
        id="sozz"></script>
<script charset="utf-8"
        src="http://s5.qhres.com/static/ab77b6ea7f3fbf79.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="navi.jsp"></jsp:include>
<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">

            <div class="fly-panel" style="margin-bottom: 0;">
                <ul class="fly-list">

                    <c:forEach items="${fileList }" var="file">

                        <li><a href="${pageContext.request.contextPath }/homepage${file.user.id }.html"
                               class="fly-avatar"> <img
                                src="${pageContext.request.contextPath}${file.user.image }" alt="${file.user.niko }">
                        </a>
                            <h2>
                               <a href="${pageContext.request.contextPath }/file/download${file.fileId }.html">${file.fileTitle } </a>
                            </h2>

                        </li>

                    </c:forEach>

                </ul>

            </div>

        </div>


    </div>
</div>
<a href="/bbs/forum/add.html" class="site-tree-mobile-edit layui-hide">
    <i class="iconfont icon-fabu"></i>
</a>
<jsp:include page="footer.jsp"></jsp:include>
<!--页面JS脚本-->

<script type="text/javascript" src="${pageContext.request.contextPath }/js/home.js"></script>


<ul class="layui-fixbar">
    <li class="layui-icon" lay-type="bar1"
        style="background-color: #009688">
    </li>
    <li class="layui-icon layui-fixbar-top" lay-type="top"
        style="background-color: #009688">
    </li>
</ul>
</body>
</html>