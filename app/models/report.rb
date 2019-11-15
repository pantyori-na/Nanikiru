class Report < ApplicationRecord
  belongs_to :user
  enum report_type:{sensitive:0,spam:1,hijacked:2,impersonation:3, others:4}, _prefix: true
end
