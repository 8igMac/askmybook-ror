require 'http'

module HomepageHelper
  # TODO
  def self.answer_query_with_context(question_asked, docs, doc_embs)
    header = "Sahil Lavingia is the founder and CEO of Gumroad, and the author of the book The Minimalist Entrepreneur (also known as TME). These are questions and answers by him. Please keep your answers to three sentences maximum, and speak in complete sentences. Stop speaking once your point is made.\n\nContext that may be useful, pulled from The Minimalist Entrepreneur:\n"

    question = 'How many years did the author took for him to realize the consequence behind a "grows at all cost" mindset?'

    context = 'self-organizing principles, and worker ownership. But they all focus on problem-solving for a specific community and not taking themselves so seriously . No matter their differences, we can learn from them all. Unfortunately , the word “entrepreneur” has a weird taint to it. I remember going to “Career Day” at school, and not identifying with the “entrepreneurs” at all. They seemed like businessmen (they were always men), and I didn’t like business. I liked making things! But eventually I realized that a business is not an end in and of itself. A business is a tool to make or do stuf f. It’s a legal structure; that’s it. At first I didn’t need a company , but eventually my creations required a legal structure, a team, and an operation to make the stuf f I wanted to make. I saw that the best way to solve the problem I wanted to solve was to start a business around it. That’ s how I became a founder . When I made my transition from unicorn chaser to minimalist entrepreneur , I had to wrap my head around another new normal. This book is about exploding the myths we tell ourselves about the best way to build impactful businesses for the abstract, singular “world,” and about seeking the truth about how to build the businesses that will make us and our communities wealthier , healthier , and happier . In the end, my failure to launch Gumroad into the stratosphere was the best thing that ever happened to me because it taught me the very real consequences behind a “growth at all costs” mindset. Unfortunately , it took me eight years to realize this, and a lot of suf fering. I hope this book will help other aspiring entrepreneurs learn the lessons I learned without the painful layof fs and years of soul-searching. The overwhelming response to the viral essay I wrote about my experience is more proof that this promise resonates with many . This book, part manifesto, part manual, will explain the core principles of these new , right-sized businesses and help you design, build, and successfully grow your own. Now, let’s get into it! 8'

    example = "\n\n\nQ: Should we start the business on the side first or should we put full effort right from the start?\n\nA:   Always on the side. Things start small and get bigger from there, and I don't know if I would ever “fully” commit to something unless I had some semblance of customer traction. Like with this product I'm working on now!"
    # TODO: Get question_asked embedding.

    # TODO: Get context.

    # TODO: Get response from LLM.
    prompt = "#{header}#{context}#{example}\n\n\nQ: #{question}\n\nA: "
    response = HomepageHelper.llm(prompt)

    { context: context, answer: response }
  end

  def self.order_document_section_by_query_similarity(query, contexts); end

  def self.llm(prompt)
    api_key = Rails.application.credentials.palm_api_key[:key]
    url = 'https://generativelanguage.googleapis.com/v1beta3/models/text-bison-001:generateText'
    res = HTTP.post(url, json: { "prompt": { "text": prompt } }, params: { key: api_key }).parse
    res['candidates'][0]['output']
  end

  def self.vector_similarity(x, y)
    # Define two vectors.
    x = Numo::DFloat.cast(x)
    y = Numo::DFloat.cast(y)
    # Return the dot product.
    y.dot(x)
  end
end
