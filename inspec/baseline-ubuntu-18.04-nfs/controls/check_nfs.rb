# copyright: 2021, Urs Voegele

title "check nfs"

# check nfs-kernel-server package
control "nfs-1.0" do                            # A unique ID for this control
  impact 1.0                                    # The criticality, if this control fails.
  title "check if nfs-server is installed"      # A human-readable title
  desc "check nfs-server package"
  describe packages(/nfs-kernel-server/) do     # The actual test
    its('statuses') { should cmp 'installed' } 
  end
end
