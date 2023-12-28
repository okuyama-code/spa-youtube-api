class Api::V1::SearchController < ApplicationController
  # http://127.0.0.1:3000/api/v1/search/posts
  # http://127.0.0.1:3000/api/v1/search/posts?q=a


  def posts
    posts_per_page = 2
    # If you're using a different DB, you might need to use ILIKE instead of LIKE
    @posts = Post.where('title LIKE ? OR body LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%").order(created_at: :desc)
    posts_with_images = paginate_posts(@posts, posts_per_page)
    total_posts_count = @posts.count

    render json: {
      posts: posts_with_images,
      total_count: total_posts_count,
      per_page: posts_per_page
    }
  end
end


# コードの目的：Postモデルから、タイトルまたは本文が指定のキーワードで始まる投稿を検索する

# params[:q]には検索キーワードが入っているものと仮定しています

# Postモデルからデータを検索するクエリを組み立てる
# 'title LIKE ? OR body LIKE ?'はSQLの条件式で、タイトルがキーワードで始まるか、本文がキーワードで始まる場合に一致するようになります
# "#{params[:q]}%"は部分一致を意味し、キーワードで始まる任意の文字列に一致します

# 例えば、params[:q]が"初心者"の場合、タイトルまたは本文が"初心者"で始まる投稿を検索します

# @post = Post.where('title LIKE ? OR body LIKE ?', "#{params[:q]}%", "#{params[:q]}%")
