<%@ page import="javax.validation.constraints.NotEmpty" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="cp" value="<%=request.getContextPath()%>"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게 시 판</title>

    <style type="text/css">
        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: center;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;


        }

        #modal .modal-window {
            /*overflow-y: auto;*/

            width: 800px;
            height: 600px;
            position: relative;
            top: -40px;
            padding: 10px;
            border-radius: 25px;
            background-color: whitesmoke;
            border: 1px black;

            box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);


        }

        #modal .title {
            padding-left: 10px;
            display: inline;

            color: black;
        }

        #modal .title h2 {
            display: inline;
        }

        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;

            color: white;
        }

        #modal .content {
            margin-top: 20px;
            padding: 10px;
            text-shadow: 1px 1px 2px gray;
            color: black;
        }

        a {
            color: black;
            text-decoration-line: none;
            text-decoration: none;

        }

        a:link {
            color: red;
            text-decoration: none;
        }

        a:visited {
            color: black;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }


        p {
            color: black;
            border-top: 1px solid #d7d7d7;
            border-left: 1px solid #e0e0e0;
            border-right: 1px solid #e0e0e0;
            border-bottom: 0 none;

        }

        input {
            width: 100%;
            height: 46px;
            font-size: 16px;
            color: #6f6f6f;
            padding-left: 15px;
            border: 1px solid #e1e1e1;
            border-radius: 20px;


        }

        button {

            font-size: 16px;
            color: #6f6f6f;
            padding-left: 15px;
            border: 10px solid #e1e1e1;


        }
    </style>


</head>
<body>

<br/><br/>


${categoryList}
<div style=background-color:white;">
    <div id="container">

    </div>


    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <div style="text-align: right">

                    <a href="/product/list"><span class="icon_close"></span></a>
                </div>
                <div style="text-align: center">

                </div>
                <div style="text-align: center">
                    <div style="position: center"> <h3>금지 키워드 설정</h3></div><br/><br/>
                </div>
                <form:form action="" method="post" modelAttribute="">


                    <input type="hidden" name="memberId" value="${memberDTO.id}">



                    <input type="text" name="prohibitionKeywordName"  placeholder="금지키워드를 입력해주세요 (예: 담배)" size="33"
                           style="color: black; margin-right: 10cm;"    /><br/><br/>
                    <form:errors path="prohibitionKeywordName"/>
                    <strong> <input type="submit" value="금지키워드 등록" style="background-color: #90C8AC; color: white"/><br/></strong>

                </form:form>

                <form:form action="/prohibitionkeyword/prohibitionkeywordDelete" method="post">

                    <br/><br/>

                    <c:forEach var="prohibitionKeywordList" items="${prohibitionKeywordList}">



                        <button type="submit"  class="btn btnEvent" name="id" value="${prohibitionKeywordList.id}
                            " style="background-color:#90C8AC; color: white;  border-radius: 20px;">
                            <div>
                                    ${prohibitionKeywordList.prohibitionKeywordName}
                                <a href="/product/prohibitionkeywordDelete"><span class="icon_close " style="color: black"></span></a>

                            </div>

                        </button>




                    </c:forEach>




                </form:form>









            </div>

        </div>
    </div>

    <script type="text/javascript">

        $(window).on('load', function () {
            load('#js-load', '4');
            $("#js-btn-wrap .button").on("click", function () {
                load('#js-load', '4', '#js-btn-wrap');
            })
        });
    </script>

    <script>


        const modal = document.getElementById("modal")

        function modalOn() {
            modal.style.display = "flex"
        }

        function isModalOn() {
            return modal.style.display === "flex"
        }

        function modalOff() {
            modal.style.display = "none"
        }

        const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
            modalOff();
        })

    </script>

</div>


<br/><br/>



</body>
</html>