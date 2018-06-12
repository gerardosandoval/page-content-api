require 'rails_helper'

RSpec.describe 'Pages API', type: :request do
  # initialize test data 
  let!(:pages) { create_list(:page, 10) }

  describe 'GET /pages' do
    before { get '/pages' }
    subject { JSON.parse(response.body) }

    it 'returns all pages' do
      expect(response).to be_success
      expect(subject["data"].count).to eq(10)
    end

    it 'returns associated elements and links with each page' do
      first_page = subject["data"].first

      expect(first_page["attributes"]["elements"].count).to eq(5)
      expect(first_page["attributes"]["links"].count).to eq(5)
    end

    it "returns correct associated attributes for each page" do
      first_page = subject["data"].first
      first_element = first_page["attributes"]["elements"].first
      first_link = first_page["attributes"]["links"].first

      expect(first_element.keys).to match_array(%w(id element_type content))
      expect(first_link.keys).to match_array(%w(id url))
    end
  end

  describe 'POST /pages' do
    subject { post '/pages?url=http://jsonapi-resources.com/' }

    context "when valid" do
      it "request is successful" do
        subject

        expect(response).to be_success
      end

      it "saves page indexed content" do
        expect{ subject }.to change{ Page.count }.by(1)
      end

      it "returns indexed content" do
        subject
        json = JSON.parse(response.body)

        expect(json["data"]["attributes"].keys).to match_array(%w(url elements links))
      end
    end
  end
end