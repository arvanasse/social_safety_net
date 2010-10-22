Given /^(.+) case(?:s*) exist(?:s*) with the reference number "([^\"]*)"$/ do |case_count, ref_number|
  25.times{ ManagedCase.make :agency_id => @user.agency_ids.first }
  
  ManagedCase.delete_all :reference => ref_number,
                         :agency_id => @user.agency_ids.first

  case_count.to_i.times do
    ManagedCase.make :reference => ref_number,
                     :agency_id => @user.agency_ids.first
  end
end
