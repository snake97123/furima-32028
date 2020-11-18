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

    it 'passwordが英数混合だが、字数が5文字以下であれば登録できないこと' do
      @user.password = '1a345'
      @user.password_confirmation = '1a345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが半角英語のみだと登録ができないこと' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが数字のみだと登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'family_nameが空だと登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'family_nameに全角（漢字・ひらがな・カタカナ）以外が入っていると登録できない'do
     @user.family_name = '@1A'
     @user.valid?
     expect(@user.errors.full_messages).to include("Family name is invalid")
   end
    it 'family_name_kanaが空だと登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'family_name_kanaに全角（カタカナ）以外が入っていると登録できない' do
      @user.family_name_kana = '@1Aあいう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it 'first_nameが空だと登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）以外が入っていると登録できない'do
     @user.first_name = '@1A'
     @user.valid?
     expect(@user.errors.full_messages).to include("First name is invalid")
   end
    it 'first_name_kanaが空だと登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaに全角（カタカナ）以外が入っていると登録できない' do
      @user.first_name_kana = '@1Aあいう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'birth_dayが空だと登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    
  end
end
