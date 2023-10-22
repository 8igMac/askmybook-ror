class HomepageController < ApplicationController
  # Skip CSRF protection for the specific action.
  skip_before_action :verify_authenticity_token, only: :ask

  def index
  end

  def ask
    question_asked = ask_params
    unless question_asked.end_with?("?")
      question_asked << "?"
    end

    # TODO: If is cached question, return cached answer.

    # TODO: Otherwise, load embedding and answer qustion with context.
    docs = "a list of content of each pages"
    doc_embs = "a list of embeddings of content of each page"
    result = HomepageHelper.answer_query_with_context(question_asked, docs, doc_embs)
    context = result[:context]
    answer = result[:answer]

    # TODO: Save the question in cache.
    question = question_asked

    data = {
      question: question,
      answer: answer,
      id: "some id" # TODO: Set primary key in question model.
    }
    render json: data
  end

  private
  # Do the parameter check using Strong Typeing in Rails.
  def ask_params
    params.require(:question)
  end
end
