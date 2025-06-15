document.addEventListener("DOMContentLoaded", function () {
  const countElements = document.querySelectorAll(".participant-count");

  countElements.forEach((countEl) => {
    const target = parseInt(countEl.innerText.replace(/,/g, ""), 10);
    let start = 0;
    const duration = 1500;
    const startTime = performance.now();

    function easeOutQuad(t) {
      return t * (2 - t);
    }

    function formatNumber(num) {
      return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function animate(currentTime) {
      const elapsed = currentTime - startTime;
      const progress = Math.min(elapsed / duration, 1);
      const easedProgress = easeOutQuad(progress);
      const currentValue = Math.floor(start + (target - start) * easedProgress);

      countEl.innerText = formatNumber(currentValue);

      if (progress < 1) {
        requestAnimationFrame(animate);
      }
    }

    requestAnimationFrame(animate);
  });
});
