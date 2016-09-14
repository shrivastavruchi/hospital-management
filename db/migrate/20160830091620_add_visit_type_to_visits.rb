class AddVisitTypeToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :visit_type,  :string
    add_column :visits, :visit_count,  :integer ,:default=>0
  end  
end

