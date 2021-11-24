require 'rails_helper'

RSpec.describe 'Barモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    # factoriesで作成したダミーデータを使用します。
    let(:user) { FactoryBot.create(:user) }
    let!(:bar) { build(:bar, user_id: user.id) }

    # test_barを作成し、空欄での登録ができるか確認します。
    subject { test_bar.valid? }
    let(:test_bar) { bar }


    context 'bar_nameカラム' do
      it '空欄でないこと' do
        test_bar.bar_name = ''
        is_expected.to eq false;
      end
      it '20文字以下であること' do
        bar.bar_name = Faker::Lorem.characters(number:21)
        expect(bar.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Bar.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    # has_manyの関係性で記述するのもありです。
    # context 'BarCommentモデルとの関係' do
      # it '1:Nとなっている' do
        # expect(Post.reflect_on_association(:_comments).macro).to eq :has_many
      # end
    # end
  end
end