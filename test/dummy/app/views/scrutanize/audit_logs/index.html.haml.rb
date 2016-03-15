= link_to 'Back', Scrutanize.configuration.back_link_path, class: 'btn btn-primary audit-log-back-link'
%h1 Audit Logs
- if current_page?(audit_logs_path)
  = link_to 'Show with deleted', all_audit_logs_path
- else
  = link_to 'Hide deleted', audit_logs_path

%table.table.table-striped.audit-logs
  %thead
    %tr
      %th Audit Type
      %th Message
      %th Created At
      %th Actions
  %tbody
    - @audit_logs.each do |log|
      %tr
        %td= log.audit_type
        %td= log.message
        %td= log.created_at.to_formatted_s(:long)
        %td
          - if log.deleted_at.nil?
            = button_to 'Delete', destroy_audit_log_path(log), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger'
          - else
            = button_to 'Restore', restore_audit_log_path(log), method: :put, class: 'btn btn-warning'


