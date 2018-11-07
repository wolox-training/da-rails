class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org/api/'

  def book_info(isbn)
    @options = { bibkeys: { ISBN: isbn }, format: 'json', jscmd: 'data' }
    self.class.get('books', @options)
  end
end
