emb: 
	bundle exec ruby bin/pdf_to_pages_embeddings.rb

api_test:
	curl -X POST \
	-H "Content-Type: application/json" \
	-d '{"question": "q1"}' \
	http://localhost:3000/ask