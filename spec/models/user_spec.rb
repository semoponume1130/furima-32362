require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー情報の保存' do
    context '保存できる場合' do
  
      it 'ユーザー情報が正しく保存できること' do
        @user.save
        expect(@user).to be_valid
      end
  
    end


  context '保存できない場合' do
    it 'nicknameが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailは@を含む必要があること' do
      @user.email = 'kkkgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは半角数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は6文字以上かつ半角英数字をそれぞれ含めてください')
    end

    it 'passwordは半角英字のみでは登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は6文字以上かつ半角英数字をそれぞれ含めてください')
    end

    it 'passwordは全角英数混合では登録できないこと' do
      @user.password = '12345６'
      @user.password_confirmation = '12345６'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は6文字以上かつ半角英数字をそれぞれ含めてください')
    end

    it 'passwordは確認用を含めて2回入力すること' do
      @user.password = '12345a'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationの値の一致が必須であること' do
      @user.password = '12345a'
      @user.password_confirmation = '123456a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.firstname = '山田'
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.firstname = ''
      @user.lastname = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it 'firstnameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.firstname = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname に全角（漢字・ひらがな・カタカナ）文字を使用してください')
    end

    it 'lastnameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.lastname = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('Lastname に全角（漢字・ひらがな・カタカナ）文字を使用してください')
    end


    it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること' do
      @user.firstname_kana = 'ヤマダ'
      @user.lastname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
    end

    it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること' do
      @user.firstname_kana = ''
      @user.lastname_kana = 'タロウ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end

    it 'firstname_kanaは、全角（カタカナ）での入力が必須であること' do
      @user.firstname_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname kana は全角(カタカナ)の入力が必須です')
    end

    it 'lastname_kanaは、全角（カタカナ）での入力が必須であること' do
      @user.lastname_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Lastname kana は全角(カタカナ)の入力が必須です')
    end

    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   end
  end
end
