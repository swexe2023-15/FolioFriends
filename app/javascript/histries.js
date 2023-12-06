document.addEventListener('click', function(event) {
  if (event.target.dataset.action === 'record-history') {
    event.preventDefault();

    var bookApiId = event.target.dataset.bookApiId;
    var infoLink = event.target.getAttribute('href');

    // Ajaxリクエストを使って履歴を記録
    fetch('/histories', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({ book_api_id: bookApiId })
    }).then(function(response) {
      if (response.ok) {
        // レスポンスが成功したら、Google Booksのページにリダイレクト
        window.open(infoLink, '_blank');
      }
    });
  }
});
