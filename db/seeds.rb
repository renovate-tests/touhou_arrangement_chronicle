# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
circle = Circle.find_or_create_by!(name_ja: '上海アリス幻樂団', name_en: 'Team Shanghai Alice', circle_type: 'originator')
circle.update!(site_url: 'http://www16.big.or.jp/~zun/', blog_url: 'http://kourindou.exblog.jp/')
artist = Artist.find_or_create_by!(name_ja: 'ZUN', name_en: 'ZUN', circle: circle)
artist.update!(site_url: 'http://www16.big.or.jp/~zun/', blog_url: 'http://kourindou.exblog.jp/')
artist.arranger || artist.create_arranger
artist.composer || artist.create_composer

circle = Circle.find_or_create_by!(name_ja: '黄昏フロンティア', name_en: 'Twilight Frontier', circle_type: 'originator')
circle.update!(site_url: 'https://www.tasofro.net/', blog_url: 'http://tasofro.net/diary/index.php')
artist = Artist.find_or_create_by!(name_ja: 'あきやまうに', name_en: 'U2', circle: circle)
artist.update!(site_url: 'https://www.tasofro.net/', blog_url: 'http://tasofro.net/diary/index.php')
artist.arranger || artist.create_arranger
artist.composer || artist.create_composer
