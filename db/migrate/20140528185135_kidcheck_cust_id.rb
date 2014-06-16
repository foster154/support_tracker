class KidcheckCustId < ActiveRecord::Migration
  def change
  	change_table :customers do |t|
  		t.rename :cust_id, :kc_cust_id
  	end
  end
end
