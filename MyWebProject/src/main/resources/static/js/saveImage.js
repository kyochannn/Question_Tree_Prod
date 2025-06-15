function saveImage () {
	const target = document.getElementById('result-card');

	// 1. 임시로 보이게 만듦
	target.classList.remove('d-none');

	// 2. 캡처를 약간의 딜레이 후 실행 (렌더링 완료를 기다림)
	setTimeout(() => {
	    html2canvas(target).then(canvas => {
	        const link = document.createElement('a');
	        link.download = 'my_egen_teto.png';
	        link.href = canvas.toDataURL('image/png');
	        link.click();

	        // 3. 다시 숨김
	        target.classList.add('d-none');
	    });
	}, 100); // 100ms 딜레이
}