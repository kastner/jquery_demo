class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.belongs_to :author

      t.timestamps
    end
    
    a = Author.create(:name => "David A. Black")
    a = Author.create(:name => "James Joyce")
    a = Author.create(:name => "Scott Raymond")
    a = Author.create(:name => "David Heinemer Hanson")
    a = Author.create(:name => "Albert Hoffman")
    a = Author.create(:name => "Steven King")
    a = Author.create(:name => "John Grisham")
  end

  def self.down
    drop_table :books
  end
end
