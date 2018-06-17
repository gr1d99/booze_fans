module AlcoholControllerHelper
  def create_alcohol(alcohol)
    if alcohol.valid?
      alcohol.save
      { created: true, alcohol: alcohol }
    else
      { created: false, errors: alcohol.errors }
    end
  end
end