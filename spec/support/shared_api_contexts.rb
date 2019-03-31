# spec/support/shared_api_contexts.rb
shared_context 'a failed create' do
  it 'returns an unprocessable entity (422) status code' do
    expect(response.status).to eq(422)
  end
end

shared_context 'a successful request' do
  it 'returns an OK (200) status code' do
    expect(response).to have_http_status(200)
  end
end

shared_context 'a successful no content request' do
  it 'returns an OK (204) status code' do
    expect(response).to have_http_status(204)
  end
end

shared_context 'a successful created request' do
  it 'returns an OK (201) status code' do
    expect(response).to have_http_status(201)
  end
end

shared_context 'a record not exist' do
  it 'returns an 404 code' do
    expect(response.status).to eq(404)
  end
end
