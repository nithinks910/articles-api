module Api
  module V1
    class ArticlesController < ApplicationController

      def index
        articles = Article.order('created_at DESC')
        render json: {stauts: 'SUCCESS', message: 'Loaded articles', data:articles},status: :ok
      end

      def show
        article = Article.find(params[:id])
        render json: {stauts: 'SUCCESS', message: 'Loaded articles', data:article},status: :ok
      end

      def create
        article = Article.new(article_params)

        if article.save
          render json: {stauts: 'SUCCESS', message: 'Saved article', data:article},status: :ok
        else
          render json: {stauts: 'Error', message: 'Article not saved', data:article.errors},
          status: :unprocessable_entity
        end
      end

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: {stauts: 'SUCCESS', message: 'Article Deleted', data:article},status: :ok
      end

      def update
          article = Article.find(params[:id])

        if article.update_attributes(article_params)
          render json: {stauts: 'SUCCESS', message: 'updated article', data:article},status: :ok
        else
          render json: {stauts: 'Error', message: 'Article not updated', data:article.errors},
          status: :unprocessable_entity
        end
      end

      private
      def article_params
        params.permit(:title, :body)
      end



    end
  end
end
