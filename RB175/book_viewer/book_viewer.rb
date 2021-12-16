require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @contents = File.readlines("data/toc.txt")
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]

  redirect "/" unless (1..@contents.size).cover? number

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

def each_chapter
  @contents.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

def chapters_matching(query)
  results = []
  return results unless query
  each_chapter do |number, name, contents|
    next unless contents.include?(query)
    paragraphs = []
    contents.split("\n\n").each_with_index do |paragraph, idx|
      paragraphs << [paragraph, idx] if paragraph.include?(query)
    end
    results << {number: number, name: name, paragraphs: paragraphs}
  end
  results
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

not_found do
  redirect "/"
end

helpers do

  def in_paragraphs(chapter)
    chapter.split("\n\n").map.with_index do |paragraph, idx|
      "<p id=\"#{idx}\">#{paragraph}</p>"
    end.join
  end

  def highlight(text, term)
    text.gsub(term, %(<strong>#{term}</strong>))
  end
end
