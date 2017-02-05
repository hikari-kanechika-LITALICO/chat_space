require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }
  before do
    login_user user
  end
  let(:group) { create(:group) }
  let(:groups) { create(:group) }
  let(:message) { create(:message, user_id: user.id, group_id: group.id) }
  let(:messages){ create_list(:message, 5, user: user, group: group )}

  describe 'GET #index' do
    before do
      get :index, group_id: group
    end
    it "populates an array of groups starting to @group" do
      #指定されたもので始まるグループを@groupにまとめること
      expect(assigns(:group)).to eq group
    end
    it "populates an array of messages starting to @messages" do
      #指定された文字で始まるメッセージを@messagesにまとめること
      expect(assigns(:messages)).to eq messages
    end
    it "saves the new message in the database" do
      #データベースに新しいメッセージ
      expect(message).to be_valid
    end
  end

  describe 'POST #create' do
      let(:request) { post :create, group_id: group, message: attributes_for(:message) }
    context "with valid attributes" do
      #有効な属性の場合
      it "saves the new message in the database" do
        # データーベースに新しいメッセージを保存すること
        expect(message).to be_valid
      end
      it "redirects to message#show" do
        # message#show にリダイレクトすること
        request
        expect(response).to redirect_to group_messages_path(group)
      end
    end
    context "with invalid attributes" do
      # 無効な属性の場合
      it "does not save the new contact in the database" do
        # データーベースに新しい連絡先を保存しないこと
        message = Message.new(text: nil)
        message.valid?
        expect(message.errors[:text]).to include("を入力してください。")
      end
      it "re-renders the :index template" do
        # :index テンプレートを再表示すること
        request
        expect(response).to redirect_to group_messages_path
      end
    end
  end
end
