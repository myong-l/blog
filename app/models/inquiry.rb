class Inquiry < ActiveRecord::Base
	include ActiveModel::Model #ここでActiveModelを読み込んで、DBと繋がらないモデルとしている

  attr_accessor :name, :email, :message #これ大事

  validates :name, :presence => {:message => '名前を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
  validates :message, :presence => {:message => 'お問い合わせ内容を記載して下さい'}
end
