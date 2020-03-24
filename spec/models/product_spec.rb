require 'rails_helper'

RSpec.describe Product, type: :model do

  #ジャンルが存在している場合
  context "is Genre not nil" do 
    
    #Genreの初期値を作成
    before do 
      Genre.create(genre: "ジャンル",display_status: true)
    end
  
    # 成功チェック
    it "is valid with all columns" do 
      product = Product.new(genre_id: 1,name: "商品", description: "aaa",image_id: "aaa.jpg",unit_price: 300,status: true)
      expect(product).to be_valid
    end

    #genre_idを除いた場合に失敗するかのチェック
    it "is invalid without a genre_id" do 
      product = Product.new(genre_id: nil,name: "商品", unit_price: 300,status: true)
      expect(product).not_to be_valid
    end
    
    # nameを除いた場合に失敗するかのチェック
    it "is invalid without a name" do 
      product = Product.new(genre_id: 1,name: "", unit_price: 300,status: true)
      expect(product).not_to be_valid
    end

    # unit_priceを除いた場合に失敗するかのチェック
    it "is invalid without a unit_price" do 
      product = Product.new(genre_id: 1,name: "商品", unit_price: nil,status: true)
      expect(product).not_to be_valid
    end

    #statusを除いた場合に失敗するかのチェック
    it "is invalid without a status" do 
      product = Product.new(genre_id: 1,name: "商品", unit_price: 300,status: nil)
      expect(product).not_to be_valid    
    end
  end

  #ジャンルが存在していない場合
  context "is Genre nil" do 

    # genre_idのリレーション先がないことでエラーになることを確認
    it "is valid with all columns" do 
      product = Product.new(genre_id: 1,name: "商品", description: "aaa",image_id: "aaa.jpg",unit_price: 300,status: true)
      expect(product).not_to be_valid
    end
  end
end
