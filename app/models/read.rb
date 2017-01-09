class Read < ApplicationRecord
  has_many :hits

  def todays_hits
    hits.where("created_at > ?", Time.now-1.day)
  end

  def self.top_ten_daily
    raw = self.all.map{ |read| [read.url, read.todays_hits.count]}
    sorted = raw.sort_by{|k,v|v}.reverse.to_h
    sorted.map { |url, hits| Hotread.new(url: url, hits: hits)}.first(10)
  end
end
