class AddDetailsToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :details, :text
  end
end
