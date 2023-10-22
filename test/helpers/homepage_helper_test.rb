require 'test_helper'

class HomepageHelperTest < ActiveSupport::TestCase
  def test_answer_query_with_context
    question = 'How many years did the author took for him to realize the consequence behind a "grows at all cost" mindset?'

    result = HomepageHelper.answer_query_with_context(question, 'doc', 'context')
    # puts result[:context]
    puts result[:answer]
  end

  def test_order_document_section_by_query_similarity
    # x = [1, 2, 3]
    # y = [4, 5, 6]
    # query
    # result = rag.order_document_section_by_query_similarity(query, contexts)
  end

  def test_llm
    prompt = 'Tell me a short joke.'
    llm_response = HomepageHelper.llm(prompt)
    puts llm_response
  end

  def test_get_embeddings; end

  def test_vector_similarity
    x = [1, 2, 3]
    y = [4, 5, 6]
    result = HomepageHelper.vector_similarity(x, y)
    assert_equal 32.0, result
  end
end
