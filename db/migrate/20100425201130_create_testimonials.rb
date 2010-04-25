class CreateTestimonials < ActiveRecord::Migration
  def self.up
    create_table :testimonials do |t|
      t.string :from
      t.text :body
      t.text :body_html

      t.timestamps
    end
  end

  def self.down
    drop_table :testimonials
  end
end
