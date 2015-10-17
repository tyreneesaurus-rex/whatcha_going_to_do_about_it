class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true


  default_scope { order("priority ASC") }

  def urgency
    panel_type = "panel "
    if completed
      panel_type += "panel-success"
    else
      if due_on && (due_on - Date.today <= 1)
        panel_type += due_on < Date.today ? "panel-danger":"panel-warning"
      else
        panel_type += "panel-primary"
      end
    end
  end
end
