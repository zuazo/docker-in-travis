require_relative '../serverspec_helper'

describe 'Docker image run' do
  it 'installs PHP version 5.6' do
    expect(command('php -v').stdout).to match(/^PHP 5\.6/)
  end

  describe package('apache2') do
    it { should be_installed }
  end

  describe process('apache2') do
    it { should be_running }
  end

  describe file('/var/www/html/index.php') do
    it { should be_file }
  end

  it 'returns my web page' do
    expect(command('curl -L http://127.0.0.1').stdout).to include 'My Web Page'
  end
end
