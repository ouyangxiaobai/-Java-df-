<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>RunJS 演示代码</title>
    <script>
        onload = function() {
            var cks = document.getElementsByName("ck");
            for (var i = 0; i < cks.length; i++) {
                cks[i].onclick = function() {
                    for (var j = 0; j < cks.length; j++) {
                        cks[j].disabled = false;
                    }
                    this.disabled = true;
                } 
            }
        }
    </script>
</head>
 
<body>
    <button name="ck">one</button>
    <button name="ck" disabled="true">two</button>
</body>
 
</html>