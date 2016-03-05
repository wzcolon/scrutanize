# Run all audits defined in `app/models/auditors` once a day.
# To create your own schedule see
# https://github.com/javan/whenever#example-schedulerb-file

every 1.day, :at => '4:30 am' do
  runner "Scrutanize::Auditor.run_all_audits"
end
