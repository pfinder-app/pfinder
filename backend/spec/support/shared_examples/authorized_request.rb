RSpec.shared_examples 'an unauthorized request' do
  it 'returns correct users' do
    expect(response).to have_http_status :unauthorized
  end
end

RSpec.shared_examples 'an authorized request' do
  it 'returns correct users' do
    expect(response).to have_http_status :ok
  end
end
