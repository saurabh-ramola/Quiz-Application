module ApplicationHelper
  def allquestions(subgenre_id)
    question=Question.where(subgenre_id:subgenre_id)
  end
  def subgenreName(subgenre_id)
    subgenre = Subgenre.where(genre_id:subgenre_id)
  end
end
