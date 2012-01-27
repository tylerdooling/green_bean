module ApplicationHelper


  def measurement_unit_options
    %w(tsp tbsp cup oz lb piece can box stick jar roll whole).map { |e| [e, e] }
  end

  def food_group_options
    %w(grains fruits vegetables dairy meats nuts fats spices).map { |e| [e, e] }
  end

  def recipe_type_options
    %w(appetizer side entre dessert).map { |e| [e, e] }
  end

  def meal_time_options
    %w(breakfast lunch dinner snack).map { |e| [e, e] }
  end

  def fieldcontain(html_options = {})
    #res = <<-DIV
      #<div data-role = 'fieldcontain'>
        ##{yield}
      #</div>
    #DIV
    haml_tag :div, "data-role" => "fieldcontain" do
      yield
    end
  end

  # Process text with Markdown
  def markdown(text)
    sanitize BlueCloth::new(text).to_html
  end
end
