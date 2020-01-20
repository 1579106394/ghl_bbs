<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>上传文件</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/globall.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/tp5page.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/editor/dist/css/wangEditor.min.css">
    <script src="https://hm.baidu.com/hm.js?8809b1cab8e955d96e2d72b31e9d460c"></script>
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
    <style type="text/css">
        #div1 {
            width: 100%;
            height: 500px;
        }
    </style>
    <style type="text/css">
        .tpt_sels a {
            padding-right: 15px;
            position: relative
        }

        .tpt_sels a {
            padding: 0 20px 0 8px;
            color: #3B6268;
            background: #FFFFBA;
            border: 1px #F8E06E solid;
            margin-right: 5px;
            margin-bottom: 5px;
            font-size: 14px;
            height: 26px;
            line-height: 26px;
            display: block;
            float: left
        }

        .tpt_pres a.selected {
            padding: 0 8px;
            color: #3B6268;
            background: #FFFFBA;
            border: 1px #F8E06E solid;
            margin-right: 5px;
            margin-bottom: 5px;
            font-size: 14px;
            height: 26px;
            line-height: 26px;
            display: block;
            float: left
        }

        .tpt_pres a {
            padding: 0 8px;
            color: #fff;
            background: #5AC7A9;
            border: 1px #5AC7A9 solid;
            margin-right: 5px;
            margin-bottom: 5px;
            font-size: 14px;
            height: 26px;
            line-height: 26px;
            display: block;
            float: left
        }

        .tpt_sels a em {
            width: 12px;
            height: 12px;
            font-style: normal;
            display: block;
            position: absolute;
            top: 7px;
            right: 4px;
            z-index: 2;
            background: url(/public//images/sx.png) no-repeat 0 0;
        }

    </style>


</head>

<body>
<script>
    (function () {
        var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec" : "https://jspassport.ssl.qhimg.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec";
        document.write('<script src="' + src + '" id="sozz"><\/script>');
    })();
</script>
<jsp:include page="header.jsp"></jsp:include>
<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20="" style="padding-top: 5px;">
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title">
                <li class="layui-this">上传文件</li>

            </ul>
            <form id="form" action="${pageContext.request.contextPath }/file/addFile.html" method="post" enctype="multipart/form-data">
                <div class="layui-form layui-form-pane" style="padding: 20px 0;">
                    <c:if test="${sessionScope.user.flag == 2 }">
                        <div class="layui-form-item">
                            <label for="L_title" class="layui-form-label">标题</label>
                            <div class="layui-input-block">
                                <input id="L_title" type="text" name="fileTitle" required lay-verify="required"
                                       autocomplete="off" class="layui-input">
                                <input id="fileName" name="fileName" type="hidden">
                                <input id="fileUrl" name="fileUrl" type="hidden">
                                <input id="fileRealName" name="fileRealName" type="hidden">
                            </div>
                        </div>

                        <button type="button" class="layui-btn" id="file" style="margin-bottom: 10px;">
                            <i class="layui-icon">&#xe67c;</i>选择附件
                        </button>

                    </c:if>

                    <div class="layui-form-item">
                        <button class="layui-btn" id="submitButton">立即上传</button>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/home.js"></script>

</body>
<script type="text/javascript">

    layui.use(['form', 'layer', 'table', 'upload'], function () {
        var $ = layui.jquery
            , upload = layui.upload;
        layui.use('upload', function(){
            var upload = layui.upload;

            //执行实例
            var uploadInst = upload.render({
                elem: '#file' //绑定元素
                ,accept: 'file'
                ,url: '${pageContext.request.contextPath}/upload/uploadFile.action'
                ,size: 1000
                ,size: '204800' //kb
                ,done: function(res){
                    console.log(res)
                    var fileUrl = res.fileUrl
                    var fileName = res.fileName
                    var fileRealName = res.fileRealName
                    $("#fileName").val(fileName)
                    $("#fileRealName").val(fileRealName)
                    $("#fileUrl").val(fileUrl)
                }
                ,error: function(){
                    //请求异常回调
                    layer.msg('上传失败');
                }
            });
        });
    })
</script>

</html>