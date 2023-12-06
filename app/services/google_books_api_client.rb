class GoogleBooksApiClient
  include HTTParty
  base_uri 'https://www.googleapis.com/books/v1'

  def self.search_books(query, lang: nil)
    options = { q: query }
    options[:langRestrict] = lang if lang.present?
    response = get("/volumes", query: options)

    if response.success?
      response['items']
    else
      []
    end
  end
end
