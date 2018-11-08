class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org'

  def book_info(isbn)
    @options = { query: { bibkeys: "ISBN:#{isbn}", format: 'json', jscmd: 'data' } }
    self.class.get('/api/books', @options)
  end
end
