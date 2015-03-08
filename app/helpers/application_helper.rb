module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  def sortable(column, id, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction, :id => id}, {:class => css_class}
  end
end
