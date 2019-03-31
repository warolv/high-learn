require 'rails_helper'

RSpec.describe 'Grades API', type: :request do
  # initialize test data 
  let!(:student) { create(:student) }
  let!(:teacher) { create(:teacher) }
  let!(:course)  { create(:course, teacher_id: teacher.id) }
  let!(:grade)   { create(:grade, student_id: student.id, course_id: course.id) }

  describe 'POST /api/v1/grades' do
    let(:valid_attributes) { { grade: 80, student_id: student.id, course_id: course.id } }

    context 'when the request is valid' do
      before { post '/api/v1/grades', params: valid_attributes }

      it 'creates a grade' do
        expect(json['grade']).to eq(80)
        expect(json['student_id']).to eq(student.id)
        expect(json['course_id']).to eq(course.id)
      end

      it_behaves_like 'a successful created request'
    end

    context 'when the request is invalid' do
      before { post '/api/v1/grades', params: { grade: 77 } }

      it_behaves_like 'a failed create'

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/create record - course and student with selected id must exist!/)
      end
    end
  end

  describe 'PUT /api/v1/grades/:id' do
    let(:valid_attributes) { { grade: 75, student_id: student.id, course_id: course.id } }

    context 'when the record exists' do
      before { put "/api/v1/grades/#{grade.id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it_behaves_like 'a successful no content request'
    end
  end

  describe 'DELETE /api/v1/grades/:id' do
    before { delete "/api/v1/grades/#{grade.id}" }

    it_behaves_like 'a successful no content request'
  end
end