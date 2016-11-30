class RemoveUrlsIndex < ActiveRecord::Migration
  def change
    remove_index :shortened_urls,
      :name => 'index_shortened_urls_on_long_url_and_short_url'
  end
end
