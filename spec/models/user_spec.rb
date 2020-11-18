require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail, passwordとpassword_confirmation,first_nameとfamily_name,first_name_kanaとfamily_name_kana,birth_dayがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上あれば登録できること' do
        @user.password = '123456a'
        @user.password_confirmation = '123456a'
        expect(@user).to be_valid
      end
      it 'first_nameが全角文字であれば登録できること' do
        @user.first_name = 'ぜんかく'
        expect(@user).to be_valid
      end
      it 'family_nameが全角文字であれば登録できること' do
        @user.family_name = 'ぜんかく'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カナであれば登録できること' do
        @user.first_name_kana = 'ゼンカク'
        expect(@user).to be_valid
      end
      it 'family_name_kanaが全角カナであれば登録できること' do
        @user.family_name_kana = 'ゼンカク'
        expect(@user).to be_valid
      end
    end
  end

  context '新規登録がうまくいかないとき' do
    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが＠を含まないと登録できないこと' do
      @user.email = "123yahoo.co.jp"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_nameが空だと登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'family_name_kanaが空だと登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_nameが空だと登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_name_kanaが空だと登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birth_dayが空だと登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it 'passwordが半角英語のみだと登録ができないこと' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
  end
end
