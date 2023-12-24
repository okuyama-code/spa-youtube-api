Post.destroy_all

# =========== create =================

20.times do
  Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    body: Faker::Lorem.paragraph(sentence_count: 3)
  )
end
