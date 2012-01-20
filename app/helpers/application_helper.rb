module ApplicationHelper


  def measurement_unit_options
    %w(tsp tbsp cup oz lb piece can box stick jar roll whole).map { |e| [e, e] }
  end

  def food_group_options
    %w(grains fruits vegetables dairy meats nuts fats spices).map { |e| [e, e] }
  end

  # Process text with Markdown
  def markdown(text)
    sanitize BlueCloth::new(text).to_html
  end
end
