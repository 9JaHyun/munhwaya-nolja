<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container center-contents">
    <div class="row">
        <form class="form-signin" method="post" action="login">
            <h1 class="h3 mb-3 font-weight-normal"> 로그인 </h1>
            <label for="username" class="sr-only">로그인 아이디</label>
            <input type="text" id="username" name="username" class="form-control"
                   placeholder="아이디를 입력해 주세요." required autofocus>
            <label for="password" class="sr-only">비밀번호</label>
            <input type="password" id="password" name="password" class="form-control"
                   placeholder="비밀번호를 입력해 주세요" required>
            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" name="remember-me"> 로그인 기억하기
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block"  type="submit"> 로그인 </button>
<%--            <div class="error-message" th:if="${loginError}">--%>
<%--                <span> 아이디나 패스워드가 올바르지 않습니다. </span>--%>
<%--            </div>--%>
        </form>
    </div>
</div>
