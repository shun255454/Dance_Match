require 'rails_helper'

RSpec.describe User, type: :model do
  
  it '有効なユーザー' do 
    user = build(:user)
    expect(user).to be_valid
  end

  it 'nameが空のときは登録できない' do 
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it 'saveするとユーザーが一人追加されている'do
      user = build(:user)
      expect{ user.save }.to change{ User.count }.by(1)
    end

  it'nameが空でない場合は保存できる'do
        user = build(:user, name: "a")
        expect(user).to be_valid
      end

  describe "email" do
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailにドメインがない場合は登録できないこと" do
      user = build(:user, email: "satou@")
      expect(user).not_to be_valid
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "emailに@がない場合は登録できないこと" do
      user = build(:user, email: "satougmail.com")
      expect(user).not_to be_valid
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
  end

  describe "password" do
    it "passwordがない場合は登録できないこと" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
    end

    it "password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it " passwordが6文字以上であれば登録できること " do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it " passwordとpassword_confirmationが一致しない場合は保存できない " do
      user = build(:user, password: "1234567", password_confirmation: "123456")
      expect(user).not_to be_valid
    end
  end

  describe "img_name" do
    it "img_nameがない場合は登録できないこと" do
      user = build(:user, img_name: nil)
      user.valid?
      expect(user.errors[:img_name]).to include("を入力してください")
    end
  end

  describe "self_introduction" do
    it "self_introductionが空の場合でも登録できる" do
      user = build(:user, self_introduction: nil)
      expect(user).to be_valid
    end
  end
end
