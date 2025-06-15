window.onload = function () {
    // 숨겨진 input 요소의 값 가져오기
    let failUserName = document.querySelector(".dist");
    let loginBtn = document.querySelector(".login-btn");

    // failMsg 값이 존재하면 처리
    if (failUserName && loginBtn) {
        let failMsg = failUserName.value.trim();

        console.log("failMsg:", failMsg); // 콘솔에서 값 확인

        if (failMsg !== "") {
            // 배경색 변경
            loginBtn.style.backgroundColor = "grey";
            loginBtn.style.color = "white";

            // 원래 value 값 저장 후 변경
            let originalValue = loginBtn.value;
            console.log("originalValue:", originalValue);
            loginBtn.value = "아이디 또는 비밀번호를 확인하세요.";
            setTimeout(() => {
                loginBtn.value = originalValue;

                loginBtn.style.backgroundColor = "#388da8";
            }, 3000); // 1.5초 후 failMsg 값으로 변경
        }
    }
};

function test() {
	location.href='/joinPage';
}