class AddVisitTypeToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :visit_ype,  :string
    add_column :visits, :visit_count,  :integer ,:default=>0
  end  
end

