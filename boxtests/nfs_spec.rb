# Test nfs server
describe service('nfs-server') do
    it { should be_enabled }
    it { should be_running }
end
