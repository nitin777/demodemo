# config/initializers/pdfkit.rb
# http://jumpstart.ge/en/blog/2012/07/generating-pdfs-on-heroku
# https://github.com/pdfkit/PDFKit
# https://github.com/pdfkit/PDFKit/wiki/Installing-WKHTMLTOPDF
PDFKit.configure do |config|
  config.wkhtmltopdf = (Rails.env.production? ? Rails.root.join('vendor', 'bin', 'wkhtmltopdf-amd64').to_s : '/usr/bin/wkhtmltopdf')
  config.default_options = { page_size: 'A4', print_media_type: true }
  # config.default_options = {
  #   :page_size => 'Legal',
  #   :print_media_type => true
  # }
  # config.root_url = "http://localhost" # Use only if your external hostname is unavailable on the server.
end