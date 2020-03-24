require 'rails_helper'

RSpec.describe Admin, type: :model do

  #全てのカラムにデータが入っていることの確認
  it "is valid with all columns" do 
    admin = Admin.new(email: "admin@admin.com",password: "aaaaaa")
    expect(user).to be_valid
  end

  # emailにデータが入っていない時失敗するか
  it "is invalid with all columns without email" do 
    admin = Admin.new(email: "",password: "aaaaaa")
    expect(user).not_to be_valid
  end

  # passwordにデータが入っていない時失敗するか
  it "is valid with all columns" do 
    admin = Admin.new(email: "admin@admin.com",password: "")
    expect(user).to be_valid
  end

end