title "sample section"

content = inspec.profile.file("tfoutput.json")
params = JSON.parse(content)
INSTANCE_ID = params['instance_id']['value']

control "instance" do                      
  impact 0.7                                
  title "Test instance"           
  desc "An optional description..."
  describe aws_ec2_instance(INSTANCE_ID) do
    it { should exist }
    it { should be_running }
    its('image_id') { should eq 'ami-026dea5602e368e96' }
    its('tags') { should include(key: 'ENV', value: 'dev') }
    it { should_not have_roles }
  end
end
