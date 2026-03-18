document.addEventListener('DOMContentLoaded', function () {
  // Contact email obfuscation (prevents simple scraping)
  var emailEl = document.getElementById('contact-email');
  if (emailEl) {
    var chars = [109, 97, 116, 105, 97, 115, 97, 103, 101, 108, 118, 105, 115, 64, 103, 109, 97, 105, 108, 46, 99, 111, 109];
    var email = String.fromCharCode.apply(null, chars);
    var link = document.createElement('a');
    link.href = 'mailto:' + email;
    link.textContent = email;
    emailEl.textContent = '';
    emailEl.appendChild(link);
  }

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
