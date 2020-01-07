var xmlHttp=false;
    //验证登录
    function logincheck(){
        var usernameinput = document.getElementById("usernameinput").value;
        var passwordinput = document.getElementById("passwordinput").value;
        xmlHttp = new XMLHttpRequest();//AJAX利用一个构建到所有现代浏览器内部的对象-XMLHttpRequest-来实现发送和接收HTTP请求与响应信息
        xmlHttp.onreadystatechange=logincheckResult;   //设置回调函数
        var url="LoginAction?action=login&username=" + usernameinput + "&password=" + passwordinput;
        xmlHttp.open("POST",url,true);      //向服务器端发送请求
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf8");
        xmlHttp.send(null);
    }

//验证错误后的操作
    function logincheckResult(){
        var usernameinput = document.getElementById("usernameinput").value;
        var passwordinput = document.getElementById("passwordinput").value;
        //请求完成并成功返回
        if (xmlHttp.readyState==4 && xmlHttp.status==200){
            var data= xmlHttp.responseText;
            document.getElementById("checkinfo").innerHTML = "";
            if(data == "false"){
                //在不刷新页面的情况下改变id设置为checkinfo的div对象的内容
                document.getElementById("checkinfo").innerHTML = "用户名或密码错误";
            }
            if (usernameinput == ""){
                document.getElementById("checkinfo").innerHTML = "用户名不能为空";
            }
            if (passwordinput == ""){
                document.getElementById("checkinfo").innerHTML = "密码不能为空";
            }
            if (usernameinput == "" && passwordinput == ""){
                document.getElementById("checkinfo").innerHTML = "用户名和密码不能为空";
            }
            if(document.getElementById("checkinfo").innerHTML == ""){
                //当验证成功，连接到main
                window.location.href="main.jsp";
            }
        }
    }
