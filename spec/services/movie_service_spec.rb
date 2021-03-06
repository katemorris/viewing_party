require 'rails_helper'

RSpec.describe MovieService do
  describe 'instance methods' do
    describe '#movie_data' do
      it 'can return movie data' do
        VCR.use_cassette('movie_detail_550_movie_service') do
          results = MovieService.movie_data(550)
          expect(results).to be_a Hash

          expect(results).to have_key :id
          expect(results[:id]).to be_a Integer

          expect(results).to have_key :title
          expect(results[:title]).to be_a String

          expect(results).to have_key :title
          expect(results[:title]).to be_a String

          expect(results).to have_key :poster_path
          expect(results[:poster_path]).to be_a String

          expect(results).to have_key :vote_average
          expect(results[:vote_average]).to be_a(Integer).or be_a Float
        end
      end
    end
    describe '#review_data' do
      it 'can return review data' do
        VCR.use_cassette('movie_detail_550_movie_service_review') do
          review = MovieService.review_data(550)
          expect(review).to be_a Hash

          expect(review).to have_key :id
          expect(review[:id]).to be_a Integer

          expect(review).to have_key :page
          expect(review[:page]).to be_a Integer

          expect(review[:results][0]).to have_key :author
          expect(review[:results][0][:author]).to be_a String

          expect(review[:results][0]).to have_key :content
          expect(review[:results][0][:content]).to be_a String

          expect(review[:results][0]).to have_key :url
          expect(review[:results][0][:url]).to be_a String
        end
      end
    end
    describe '#cast_data' do
      it 'can return cast data' do
        VCR.use_cassette('movie_detail_550_movie_service_cast') do
          cast = MovieService.cast_data(550)
          expect(cast).to be_a Hash

          expect(cast).to have_key :id
          expect(cast[:id]).to be_a Integer

          expect(cast).to have_key :cast
          expect(cast[:cast]).to be_a Array

          expect(cast[:cast][0]).to have_key :name
          expect(cast[:cast][0][:name]).to be_a String

          expect(cast[:cast][0]).to have_key :character
          expect(cast[:cast][0][:character]).to be_a String
        end
      end
    end

    describe '#reco_data' do
      it 'can return recommended movies data' do
        VCR.use_cassette('movie_detail_550_recos') do
          recos = MovieService.reco_data(550)

          expect(recos).to be_a Hash

          expect(recos).to have_key :results
          expect(recos[:results]).to be_a Array

          expect(recos[:results][0]).to have_key :title
          expect(recos[:results][0][:title]).to be_a String

          expect(recos[:results][0]).to have_key :id
          expect(recos[:results][0][:id]).to be_a Integer
        end
      end
    end

    describe '#similar_data' do
      it 'can return similar movies data' do
        VCR.use_cassette('movie_detail_550_similar') do
          similiar = MovieService.similar_data(550)

          expect(similiar).to be_a Hash

          expect(similiar).to have_key :results
          expect(similiar[:results]).to be_a Array

          expect(similiar[:results][0]).to have_key :title
          expect(similiar[:results][0][:title]).to be_a String

          expect(similiar[:results][0]).to have_key :id
          expect(similiar[:results][0][:id]).to be_a Integer
        end
      end
    end
  end
end
