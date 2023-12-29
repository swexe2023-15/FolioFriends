document.addEventListener('click', function(event) {
  if (event.target.dataset.action === 'record-history') {
    event.preventDefault();

    var bookApiId = event.target.dataset.bookApiId;
    var infoLink = event.target.getAttribute('href');

    fetch('/histories', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({ book_api_id: bookApiId })
    }).then(response => {
        if (response.ok) {
          return response.json();
        } else {
          throw new Error('サーバーからのレスポンスが正しくありません。');
        }
    }).then(data => {
      if (data.status === 'success') {
        window.open(infoLink, '_blank');
      } else {
        console.error(data.message);
      }
    }).catch(error => {
      console.error('エラーが発生しました:', error);
    });
  }
});
