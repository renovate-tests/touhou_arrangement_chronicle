require 'csv'

CSV.foreach('db/fixtures/master_originals.csv') do |original|
  next if original[0] == 'code'

  code = original[0]
  title_ja = original[1]
  short_title_ja = original[2]
  original_type = original[3]

  Original.seed(:code) do |o|
    o.code = code
    o.title_ja = title_ja
    o.short_title_ja = short_title_ja
    o.original_type = original_type
  end
end
