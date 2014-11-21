module ApplicationHelper
  def detail_row(property, value)
    capture_haml do
      haml_tag 'div', class: 'row' do
        haml_tag 'div', class: 'col-sm-2' do
          haml_tag 'p' do
            haml_tag 'b', property
          end
        end
        haml_tag 'div', class: 'col-sm-2' do
          haml_tag 'p', value
        end
      end
    end
  end
end
