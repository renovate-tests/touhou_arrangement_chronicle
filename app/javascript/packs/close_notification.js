var closeNotification = document.querySelectorAll('.close-notification');
if (closeNotification.length > 0) {
  closeNotification.forEach(closeIcon => {
    closeIcon.addEventListener('click', () => {
      closeIcon.closest('.notification').remove();
    });
  });
}
