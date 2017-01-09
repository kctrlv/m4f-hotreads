class Read < ApplicationRecord
  has_many :hits

  def todays_hits
    hits.where("created_at > ?", Time.now-1.day)
  end

  def self.top_ten_daily
    raw = self.all.map{ |read| [read.url, read.todays_hits.count]}.sort.reverse.to_h
    raw.map { |url, hits| Hotread.new(url: url, hits: hits)}.first(10)
  end
end
