document.addEventListener('DOMContentLoaded', function () {
  // Toggle behavior for the courses/certificates list
  document.querySelectorAll('.toggle').forEach(function (toggle) {
    toggle.addEventListener('click', function (event) {
      event.preventDefault();
      var inner = toggle.nextElementSibling;
      if (!inner) return;

      var list = toggle.closest('ul');
      if (list) {
        list.querySelectorAll('li .inner.show').forEach(function (open) {
          if (open !== inner) {
            open.classList.remove('show');
            open.style.display = 'none';
          }
        });
      }

      var isVisible = inner.classList.toggle('show');
      inner.style.display = isVisible ? 'block' : 'none';
    });
  });
});

function swap_order() {
  var mainFrameOne = document.getElementById('categorical');
  var mainFrameTwo = document.getElementById('chronological');
  if (!mainFrameOne || !mainFrameTwo) return;

  var showingOne = window.getComputedStyle(mainFrameOne).display !== 'none';
  mainFrameOne.style.display = showingOne ? 'none' : 'block';
  mainFrameTwo.style.display = showingOne ? 'block' : 'none';
}
