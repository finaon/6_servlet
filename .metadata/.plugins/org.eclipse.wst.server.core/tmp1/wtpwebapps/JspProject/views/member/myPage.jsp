<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        background: black;
        color: white;
        width: 1000px;
        margin: auto;
        margin-top: 50px;
        padding: 10px 0 50px 0;
    }

    table{
        margin: auto;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		String phone = loginUser.getPhone() == null ? "" : loginUser.getPhone();
		String email = loginUser.getEmail() == null ? "" : loginUser.getEmail();
		String address = loginUser.getAddress() == null ? "" : loginUser.getAddress();
		String interest = loginUser.getInterest() == null ? "" : loginUser.getInterest();
	%>
	
	<div class="outer">
        <br>
        <h2 align="center">회원가입</h2>
        <form action="<%=contextPath%>/update.me" id="enroll-form" method="POST">
            <table>
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" name="userId" maxlength="12" value="<%=userId %>" required></td>
                    <td><button type="button">중복확인</button></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="userName" maxlength="6" value="<%=userName %>" required></td>
                </tr>
                <tr>
                    <td>* 전화번호</td>
                    <td><input type="text" name="phone" placeholder="-포함해서 입력" value="<%=phone %>" ></td>
                </tr>
                <tr>
                    <td>* 이메일</td>
                    <td><input type="text" name="email" value="<%=email %>" ></td>
                </tr>
                <tr>
                    <td>* 주소</td>
                    <td><input type="text" name="address" value="<%=address %>"  ></td>
                </tr>
                <tr>
                    <td>관심분야</td>
                    <td colspan="2">
                        <input type="checkbox" name="interest" id="sports" value="운동">
                        <label for="sports">운동</label>
                        <input type="checkbox" name="interest" id="climbing" value="등산">
                        <label for="sports">등산</label>
                        <input type="checkbox" name="interest" id="game" value="게임">
                        <label for="sports">게임</label>
                        <br>
                        <input type="checkbox" name="interest" id="fishing" value="낚시">
                        <label for="sports">낚시</label>
                        <input type="checkbox" name="interest" id="cooking" value="요리">
                        <label for="sports">요리</label>
                        <input type="checkbox" name="interest" id="etc" value="기타">
                        <label for="sports">기타</label>
                    </td>
                </tr>
            </table>
            <script>
                const interest = "<%=interest%>"; // 운동, 낚시
                const inputArr = document.querySelectorAll("input[name=interest]");
                //[<input>,<input>,<input>,<input>,<input>,<input>]

                for(let input of inputArr){
                    if(interest.includes(input.value)){ // interest에 input.value의 값이 포함되어 있다면 
                        input.checked  = true;
                    }
                }
            </script>
            
            <br><br>

            <div align="center">
                <button type="submit">정보변경</button>
                <button>비밀번호변경</button>
                <button>회원탈퇴</button>
            </div>
        </form>
    </div>

    <script>
        function checkPwd(){
           const pwd = document.querySelector("#enroll-form input[name=userPwd]").value;
           const pwdCheck = document.querySelector("#enroll-form input[name=userPwdCheck]").value;

           if (pwd !== pwdCheck) {
            alert("비밀번호가 일치하지 않습니다")
            return false;
           }

        }
    </script>

</body>
</html>