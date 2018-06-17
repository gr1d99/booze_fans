module AlcoholControllerHelper
  def create_alcohol(alcohol)
    if alcohol.valid?
      alcohol.save

      { alcohol: alcohol, status: 201 }
    else
      { errors: alcohol.errors, status: 422 }
    end
  end
end