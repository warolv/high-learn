require 'rails_helper'

RSpec.describe 'Students API', type: :request do
  # initialize test data 
  let!(:students) { create_list(:student, 3) }
  let(:student_id) { students.first.id }

  describe 'GET /api/v1/students' do
    before { get '/api/v1/students' }

    it 'returns students' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it_behaves_like 'a successful request'
  end

  describe 'GET /api/v1/students/:id' do
    before { get "/api/v1/students/#{student_id}" }

    context 'when the record exists' do
      it 'returns the student' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(student_id)
      end

      it_behaves_like 'a successful request'
    end

    context 'when the record does not exist' do
      let(:student_id) { 400 }

      it_behaves_like 'a record not exist'

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Student/)
      end
    end
  end

  describe 'POST /api/v1/students' do
    let(:valid_attributes) { { first_name: 'vasya', last_name: 'pupkin', email: 'vasya_pupkin@gmail.com' } }

    context 'when the request is valid' do
      before { post '/api/v1/students', params: valid_attributes }

      it 'creates a student' do
        expect(json['first_name']).to eq('vasya')
        expect(json['last_name']).to eq('pupkin')
        expect(json['email']).to eq('vasya_pupkin@gmail.com')
      end

      it_behaves_like 'a successful created request'
    end

    context 'when the request is invalid' do
      before { post '/api/v1/students', params: { first_name: 'vasya' } }

      it_behaves_like 'a failed create'

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Last name can't be blank, Email can't be blank/)
      end
    end
  end

  describe 'PUT /api/v1/students/:id' do
    let(:valid_attributes) { { first_name: 'Moshe' } }

    context 'when the record exists' do
      before { put "/api/v1/students/#{student_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it_behaves_like 'a successful no content request'
    end
  end

  describe 'DELETE /api/v1/students/:id' do
    before { delete "/api/v1/students/#{student_id}" }

    it_behaves_like 'a successful no content request'
  end
end