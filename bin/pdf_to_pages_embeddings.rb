require "pdf-reader"

# Usage: bin/pdf_to_pages_embeddings.rb --pdf book.pdf
# Objective: Generate data with format (page_num, content, embeddings) 

reader = PDF::Reader.new("test.pdf")

reader.pages.each do |page|
  content = page.text.split().join(" ")
  puts content
  # break
end
# puts reader.pdf_version
# puts reader.info
# puts reader.metadata
# puts reader.page_count