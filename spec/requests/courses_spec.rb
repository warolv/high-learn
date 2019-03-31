require 'rails_helper'

RSpec.describe 'Courses API', type: :request do
   # initialize test data 
  let!(:teacher) { create(:teacher) }
  let!(:course) { create(:course, teacher_id: teacher.id) }

  describe 'POST /api/v1/courses' do
    let(:valid_attributes) { { name: 'Geometry', teacher_id: teacher.id } }

    context 'when the request is valid' do
      before { post '/api/v1/courses', params: valid_attributes }

      it 'creates a course' do
        expect(json['name']).to eq('Geometry')
        expect(json['teacher_id']).to eq(teacher.id)
      end

      it_behaves_like 'a successful created request'
    end

    context 'when the request is invalid' do
      before { post '/api/v1/courses', params: { name: 'Geometry' } }

      it_behaves_like 'a failed create'

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/create record - teacher with this id not exists/)
      end
    end
  end

  describe 'PUT /api/v1/courses/:id' do
    let(:valid_attributes) { { name: 'Algebra', teacher_id: teacher.id } }

    context 'when the record exists' do
      before { put "/api/v1/courses/#{course.id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it_behaves_like 'a successful no content request'
    end
  end

  describe 'DELETE /api/v1/courses/:id' do
    before { delete "/api/v1/courses/#{course.id}" }

    it_behaves_like 'a successful no content request'
  end
end