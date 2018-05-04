require 'csv'

CSV.foreach('db/fixtures/master_original_songs.csv') do |original_song|
  next if original_song[0] == 'code'

  code = original_song[0]
  original_code = original_song[1]
  title_ja = original_song[2]
  composer = original_song[3]
  track_number = original_song[4]
  is_duplicate = original_song[5].to_s == '1'

  OriginalSong.seed(:code) do |os|
    os.code = code
    os.original_code = original_code
    os.title_ja = title_ja
    os.composer = composer
    os.track_number = track_number
    os.is_duplicate = is_duplicate
  end
end
