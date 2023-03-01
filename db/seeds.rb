# Movies
100.times do
  Movie.create(
    title: Faker::Movie.unique.title,
    plot: Faker::Lorem.paragraph(sentence_count: rand(3..8))
  )
end

# Seasons
10.times do
  season_title = Faker::Lorem.sentence
  rand(3..10).times.with_index(1) do |_, i|
    season = Season.create(
      title: season_title,
      plot: Faker::Lorem.paragraph(sentence_count: rand(3..8)),
      number: i
    )

    # Episodes
    rand(5..15).times.with_index(1) do |_, i|
      season.episodes.create(
        title: Faker::Lorem.unique.sentence,
        plot: Faker::Lorem.paragraph(sentence_count: rand(3..8)),
        number: i
      )
    end
  end
end

# Purchase Options
Content.all.each do |content|
  sd = content.purchase_options.create(
    price: Faker::Commerce.price,
    quality: :sd
  )
  content.purchase_options.create(
    price: sd.price + 1,
    quality: :hd
  )
end

# Users
100.times do
  User.create email: Faker::Internet.email
end

# Purchase
User.all.each do |user|
  rand(0..5).times do
    user.purchases.create(
      purchase_option: PurchaseOption.all.sample,
      created_at: rand(Time.current - 2.month..Time.current)
    )
  end
end
