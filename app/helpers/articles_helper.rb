module ArticlesHelper
  def datebr(datetime)
    datetime.strftime('%B %e, %y')
  end
end
