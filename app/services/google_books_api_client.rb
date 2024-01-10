class GoogleBooksApiClient
  include HTTParty
  base_uri 'https://www.googleapis.com/books/v1'

  def self.search_books(query, lang: nil)
    options = { q: query, key: ENV['GOOGLE_BOOKS_API_KEY'] }
    options[:langRestrict] = lang if lang.present?
    response = get("/volumes", query: options)

    if response.success?
      response['items']
    else
      []
    end
  end
  
  def self.book_details(book_id)
    response = get("/volumes/#{book_id}")
    response.success? ? response.parsed_response : nil
  end
end
