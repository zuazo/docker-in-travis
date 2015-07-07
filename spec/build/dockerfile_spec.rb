require_relative '../spec_helper'

describe 'Dockerfile build' do
  it 'creates image' do
    expect(image).not_to be_nil
  end

  it 'runs apache in foreground' do
    expect(image_config['Cmd']).to include 'apache2-foreground'
  end

  it 'has the website path as workdir' do
    expect(image_config['WorkingDir']).to eq '/var/www/html'
  end

  it 'exposes the port 80' do
    expect(image_config['ExposedPorts']).to include '80/tcp'
  end

  it 'has PHP installed' do
    env_keys = image_config['Env'].map { |x| x.split('=', 2)[0] }
    expect(env_keys).to include('PHP_VERSION')
  end
end
