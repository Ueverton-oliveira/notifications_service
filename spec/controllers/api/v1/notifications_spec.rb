require 'rails_helper'

RSpec.describe "Api::V1::Notifications", type: :request do
  describe "POST /api/v1/notifications" do
    let(:valid_attributes) { attributes_for(:notification) }
    let(:invalid_attributes) do
      {
        notification: {
          message: "",
          received_at: nil,
          task_details: "",
          user_data: ""
        }
      }
    end

    context "with valid parameters" do
      it "creates a new Notification" do
        expect {
          post api_v1_notifications_path, params: { notification: valid_attributes }
        }.to change(Notification, :count).by(1)
      end

      it "renders a JSON response with the new notification" do
        post api_v1_notifications_path, params: { notification: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(JSON.parse(response.body)).to eq({ "message" => "Notification received" })
      end
    end

    context "with invalid parameters" do
      it "does not create a new Notification" do
        expect {
          post api_v1_notifications_path, params: { notification: invalid_attributes }
        }.to change(Notification, :count).by(0)
      end

      it "renders a JSON response with errors for the new notification" do
        post api_v1_notifications_path, params: { notification: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(JSON.parse(response.body)).to eq({ "error" => "Failed to save notification" })
      end
    end
  end
end
