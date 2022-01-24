module ArticlesHelper
  def datebr(datetime)
    datetime.strftime('%B %e, %Y')
  end
end
